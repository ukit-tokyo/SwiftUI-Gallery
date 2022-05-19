//
//  ButtonGalleryView.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/17.
//

import SwiftUI

struct ButtonGalleryView: View {
  var body: some View {
    NavigationView {
      VStack {
        FillTextButton(
          "FillTextButton",
          theme: .primary,
          font: .body.bold(),
          height: 40) {}
        FillTextButton(
          "FillTextButton",
          theme: .primary,
          font: .body.bold(),
          height: 40,
          cornerRadius: 10) {}
        BorderTextButton(
          "BorderTextButton",
          theme: .primary,
          font: .body,
          height: 40
        ) {}
        BorderTextButton(
          "BorderTextButton",
          theme: .primary,
          font: .body,
          height: 40,
          cornerRadius: 10
        ) {}

        Spacer()
      }
      .navigationBarTitleDisplayMode(.inline)
      .navigationTitle("Buttons")
    }
  }
}

struct ButtonGalleryView_Previews: PreviewProvider {
  static var previews: some View {
    ButtonGalleryView()
  }
}
