//
//  TabView.swift
//  Gallery
//
//  Created by Taichi Yuki on 2025/09/17.
//

import SwiftUI

struct PageView: View {
  struct Content: Identifiable {
    var id: String { title }
    let title: String
    let color: Color
  }

  @State var selectedID: String
  @State var indicatorOffset: CGFloat = 0

  var selectedIndex: Int {
    guard let index = contents.firstIndex(where: { $0.id == selectedID }) else {
      fatalError("Index not found for id: \(selectedID)")
    }
    return index
  }

  let contents: [Content] = [
    .init(title: "Page 1", color: .blue.opacity(0.2)),
    .init(title: "Page 2", color: .blue.opacity(0.4)),
    .init(title: "Page 3", color: .blue.opacity(0.6)),
  ]

  init(selectedId: String) {
    _selectedID = State(initialValue: selectedId)
  }

  var body: some View {
    GeometryReader { geometry in
      let indicatorWidth = geometry.size.width / CGFloat(contents.count)

      VStack(spacing: 0) {
        HStack(spacing: 0) {
          ForEach(contents) { content in
            PageTabButton(title: content.title, selected: selectedID == content.id) {
              withAnimation {
                selectedID = content.id
              }
            }
          }
        }
        .overlay(alignment: .bottomLeading) {
          Rectangle()
            .fill(.blue)
            .frame(width: indicatorWidth, height: 4)
            .offset(x: indicatorOffset)
        }
        .onChange(of: selectedID) { _ in
          withAnimation {
            indicatorOffset = indicatorWidth * CGFloat(selectedIndex)
          }
        }
        .onAppear {
          indicatorOffset = indicatorWidth * CGFloat(selectedIndex)
        }

        TabView(selection: $selectedID) {
          ForEach(contents) { content in
            PageContentView(title: content.title, color: content.color)
              .tag(content.id)
          }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .ignoresSafeArea()
      }
    }
  }
}

#Preview {
  PageView(selectedId: "Page 2")
}
