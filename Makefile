PROJECT_NAME=Gallery
PROJECT_PATH=./$(PROJECT_NAME).xcodeproj
BUILD_PATH=./build

help: ## Show usage
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

open: ## Open project
	open $(PROJECT_PATH)

test: ## Run unit test
	xcodebuild test -project $(PROJECT_PATH) -scheme "Gallery" -destination 'platform=iOS Simulator,name=iPhone 16'

testflight: ## distribute app to TestFlight
	make archive
	make export-ipa

archive: ## archive product
	xcodebuild clean archive \
		CODE_SIGNING_REQUIRED=NO \
		CODE_SIGNING_ALLOWED=NO \
		-project $(PROJECT_PATH) \
		-scheme "Gallery" \
		-archivePath $(BUILD_PATH)/Gallery.xcarchive \
		-destination 'platform=iOS Simulator,name=iPhone 16'

upload-ipa: ## export and upload IPA
	xcodebuild -exportArchive -archivePath $(BUILD_PATH)/Gallery.xcarchive -exportOptionsPlist ExportOptions.plist -exportPath $(BUILD_PATH)

export-ipa: ## export IPA
	$(eval PATH := $(if $(EXPORT_PATH),$(EXPORT_PATH),$(BUILD_PATH)))
	xcodebuild \
		-exportArchive \
		-archivePath $(BUILD_PATH)/Gallery.xcarchive \
		-exportOptionsPlist ExportOptions.plist \
		-exportPath $(PATH) \
		-authenticationKeyPath $(API_KEY_PATH) \
		-authenticationKeyID $(API_KEY_ID) \
		-authenticationKeyIssuerID $(ISSUER_ID) \
		-allowProvisioningUpdates \

## - cleaner

clean: ## clean all
	xcodebuild clean -project $(PROJECT_PATH) -scheme "Gallery"
	xcodebuild clean -project $(PROJECT_PATH) -scheme "Gallery"
	make clean-derived-data
	make clean-archives

clean-derived-data: ## remove derived data
	rm -rf ~/Library/Developer/Xcode/DerivedData

clean-archives: ## remove archives data
	rm -rf ~/Library/Developer/Xcode/Archives
