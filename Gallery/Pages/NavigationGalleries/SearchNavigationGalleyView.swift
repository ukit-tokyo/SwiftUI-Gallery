//
//  SearchNavigationGalleyView.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/23.
//

import SwiftUI

struct SearchNavigationGalleyView: View {
  @Environment(\.presentationMode) var presentation
  @State var text: String = ""

  var body: some View {
    VStack(spacing: 8) {
      SearchNavigationBar(text: $text) {}
      SearchNavigationBar(text: $text, leftItems: [
        .init(icon: .chevronBackward) {}
      ]) {}
      SearchNavigationBar(text: $text, rightItems: [
        .init(icon: .squareAndPencil) {},
        .init(icon: .gearshape) {},
      ]) {}
      SearchNavigationBar(text: $text, rightItems: [
        .init(text: "キャンセル") {},
      ]) {}
      Spacer()
    }
  }
}

struct SearchNavigationGalleyView_Previews: PreviewProvider {
  static var previews: some View {
    SearchNavigationGalleyView()
  }
}
