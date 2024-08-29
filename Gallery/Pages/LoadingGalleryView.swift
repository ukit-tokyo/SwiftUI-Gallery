//
//  LoadingGalleryView.swift
//  Gallery
//
//  Created by Taichi Yuki on 2024/08/29.
//

import SwiftUI

struct LoadingGalleryView: View {
  @State var isCoveredLoading: Bool = false
  @State var isNonCoveredLoading: Bool = false

  var body: some View {
    VStack {
      Spacer()

      VStack {
        FillTextButton(
          "Covered Loading",
          theme: .primary,
          font: .body.bold()) {
            withAnimation {
              isCoveredLoading.toggle()
            }
          }

        FillTextButton(
          "Non Covered Loading",
          theme: .primary,
          font: .body.bold()) {
            withAnimation {
              isNonCoveredLoading.toggle()
            }
          }
      }
      .padding(.bottom, 40)
    }
    .loadingOverlay(isLoading: isCoveredLoading)
    .loadingOverlay(isLoading: isNonCoveredLoading, covered: false)
  }
}

#Preview {
  LoadingGalleryView()
}
