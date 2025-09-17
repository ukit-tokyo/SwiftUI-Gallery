//
//  PageContentView.swift
//  Gallery
//
//  Created by Taichi Yuki on 2025/09/17.
//

import SwiftUI

struct PageContentView: View {
  let title: String
  let color: Color

  var body: some View {
    Text(title)
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .typography(.display)
      .foregroundColor(.label)
      .background(color)
  }
}

#Preview {
  PageContentView(title: "title", color: .red)
}
