//
//  ButtonGalleryView.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/17.
//

import SwiftUI

struct ButtonGalleryView: View {
  var body: some View {
    VStack {
      Group {
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
        FillIconTextButton(
          "FillIconTextButton",
          icon: .magnifyingglass,
          theme: .primary,
          font: .body.bold(),
          height: 40) {}
        FillIconTextButton(
          "FillIconTextButton",
          icon: .magnifyingglass,
          theme: .monotone,
          font: .body.bold(),
          height: 40) {}
        FillIconButton(
          .magnifyingglass,
          theme: .primary,
          size: 34,
          iconSize: 16) {}
      }

      Group {
        BorderTextButton(
          "BorderTextButton",
          theme: .primary,
          font: .body,
          height: 40,
          selectable: true) { isSelected in
            print(isSelected)
          }
        BorderTextButton(
          "BorderTextButton",
          theme: .primary,
          font: .body,
          height: 40,
          cornerRadius: 10,
          selectable: true) { isSelected in
            print(isSelected)
          }
        BorderIconTextButton(
          "BorderIconTextButton",
          icon: .magnifyingglass,
          theme: .primary,
          font: .body,
          height: 40,
          selectable: true) { isSelected in
            print(isSelected)
          }
        BorderIconTextButton(
          "BorderIconTextButton",
          icon: .magnifyingglass,
          theme: .monotone,
          font: .body,
          height: 40,
          selectable: true) { isSelected in
            print(isSelected)
          }
        BorderIconButton(
          .magnifyingglass,
          theme: .primary,
          size: 34,
          iconSize: 16,
          selectable: true) { _ in }
      }
      Spacer()
    }
    .navigationBarTitleDisplayMode(.inline)
    .navigationTitle("Buttons")
  }
}

struct ButtonGalleryView_Previews: PreviewProvider {
  static var previews: some View {
    ButtonGalleryView()
  }
}
