//
//  TextFieldGalleryView.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/08/23.
//

import SwiftUI

struct TextFieldGalleryView: View {
  @State private var text: String = ""

  var body: some View {
    VStack(spacing: 16) {
      UnderlineTextField("レストラン", text: $text)
      UnderlineTextField("メニュー", text: $text, showClearButton: false)

      Spacer()
    }
    .navigationBarTitleDisplayMode(.inline)
    .navigationTitle("Text Field")
    .padding()
  }
}

#if DEBUG
struct TextFieldGalleryView_Previews: PreviewProvider {
  static let preview: some View = TextFieldGalleryView()

  static var previews: some View {
    preview.preferredColorScheme(.light)
    preview.preferredColorScheme(.dark)
  }
}
#endif
