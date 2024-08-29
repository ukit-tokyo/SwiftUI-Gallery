//
//  SnackbarView.swift
//  Gallery
//
//  Created by Taichi Yuki on 2024/08/28.
//

import SwiftUI

struct SnackbarGalleryView: View {
  @State var isShowing = false

  var body: some View {
    VStack {
      Button(isShowing ? "Hide Snackbar" : "Show Snackbar") {
        withAnimation {
          isShowing.toggle()
        }
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .snackBar(
      isShowing: $isShowing,
      action: {
        print("testing___", "tapped snackbar")
      },
      label: {
        Text("This is Snack Bar.")
          .typography(.bodyBold)
          .foregroundStyle(.white)
      })
  }
}

#Preview {
  SnackbarGalleryView()
}
