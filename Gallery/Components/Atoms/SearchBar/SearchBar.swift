//
//  SearchBar.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/23.
//

import SwiftUI

struct SearchBar: View {
  private let placeholder: String
  @Binding var text: String

  init(_ placeholder: String = "", text: Binding<String>) {
    self.placeholder = placeholder
    self._text = text
  }

  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 18)
        .fill(Color.backgroundInput)
        .frame(height: 36)
      HStack(spacing: 6) {
        Spacer().frame(width: 2)
        Image.magnifyingglass
          .foregroundColor(.icon)
        TextField("", text: $text)
          .placeholder(placeholder, showWhen: text.isEmpty)

        if !text.isEmpty {
          Button {
            text.removeAll()
          } label: {
            Image.xmarkCircleFill
              .foregroundColor(.icon)
          }
          .padding(.trailing, 6)
        }
      }
    }
    .padding(.horizontal)
  }
}

//struct SearchBar_Previews: PreviewProvider {
//  static var previews: some View {
//    SearchBar(text: $"")
//  }
//}
