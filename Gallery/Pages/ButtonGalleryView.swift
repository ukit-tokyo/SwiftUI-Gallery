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
          action: {},
          label: {
            Text("FillButton")
          }
        )
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
