//
//  InstantMessageGalleryView.swift
//  Gallery
//
//  Created by Taichi Yuki on 2024/08/30.
//

import SwiftUI

struct InstantMessageGalleryView: View {
  @State var isShown: Bool = false

  var body: some View {
    VStack {
      Spacer()

      VStack {
        FillTextButton(
          "Show Instant Message",
          theme: .primary,
          font: .body.bold()) {
            withAnimation {
              isShown.toggle()
            }
          }
      }
      .padding(.bottom, 40)
    }
    .instantMessage(
      isShown: $isShown,
      type: .error,
      message: "This is error message. This is error message.")
  }
}

#Preview {
  InstantMessageGalleryView()
}

