//
//  GlowTestView.swift
//  Gallery
//
//  Created by Taichi Yuki on 2024/08/01.
//

import SwiftUI

struct GlowTestView: View {
  @State var index: Int = 0

  let items: [(title: String, color: Color)] = [
    ("NEON", .green),
    ("GLOW", .pink),
    ("LIGHT", .blue),
    ("SHINE", .orange),
    ("BRIGHT", .purple),
  ]

  var body: some View {
    let item = items[index]

    Text(item.title)
      .font(.system(size: 70, weight: .thin))
      .contentTransition(.numericText())
      .shadow(color: item.color, radius: 5)
      .shadow(color: item.color, radius: 5)
      .shadow(color: item.color, radius: 50)
      .shadow(color: item.color, radius: 100)
      .shadow(color: item.color, radius: 200)

      .onAppear {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
          withAnimation {
            index = (index + 1) % items.count
          }
        }
      }
  }
}

#Preview {
  GlowTestView()
}
