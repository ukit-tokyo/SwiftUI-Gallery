//
//  UnderlineTextField.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/08/23.
//

import SwiftUI

struct UnderlineTextField: View {
  @Binding private var text: String
  private let placeholder: String
  private let font: Font
  private let foregroundColor: Color
  private let showClearButton: Bool

  init(
    _ placeholder: String,
    text: Binding<String>,
    font: Font = .mediumNormal,
    foregroundColor: Color = .label,
    showClearButton: Bool = true
  ) {
    self.placeholder = placeholder
    self._text = text
    self.font = font
    self.foregroundColor = foregroundColor
    self.showClearButton = showClearButton
  }

  var body: some View {
    VStack(spacing: 12) {
      HStack {
        TextField("", text: $text) // Placeholderは独自のmodifierで設定する
          .font(font)
          .foregroundColor(foregroundColor)
          .placeholder(placeholder, font: font, showWhen: text.isEmpty)

        if showClearButton && !text.isEmpty {
          Button {
            text.removeAll()
          } label: {
            Image.xmarkCircleFill
              .foregroundColor(.icon)
          }
          .padding(.trailing, 6)
        }
      }

      Rectangle()
        .foregroundColor(Color.separator)
        .frame(height: 1.0)
    }
  }
}

//#if DEBUG
//struct UnderlineTextField_Previews: PreviewProvider {
//  static let preview: some View = UnderlineTextField("レストラン", text: )
//    .previewLayout(.fixed(width: 300, height: 100))
//
//  static var previews: some View {
//    preview.preferredColorScheme(.light)
//    preview.preferredColorScheme(.dark)
//  }
//}
//#endif
