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
        FillButton(
          theme: .primary,
          font: .body.bold(),
          width: 140,
          height: 40,
          action: {}) {
            Text("FillButton")
          }
        FillTextButton(
          "FillTextButton",
          theme: .primary,
          font: .body.bold(),
          width: 140,
          height: 40) {}
        BorderTextButton(
          "BorderTextButton",
          theme: .primary,
          font: .body,
          width: 180,
          height: 40) {}
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
