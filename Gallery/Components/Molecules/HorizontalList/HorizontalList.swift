//
//  HorizontalList.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/08/22.
//

import SwiftUI

struct Prefecture: HorizontalListItem {
  let id: Int
  let title: String
  var value: String { title }
}

protocol HorizontalListItem: Identifiable {
  associatedtype Value
  var id: ID { get }
  var title: String { get }
  var value: Value { get }
}

struct HorizontalList<Content: View, Item: HorizontalListItem>: View {
  private let content: (Item) -> Content
  private let items: [Item]
  private let height: CGFloat
  private let spacing: CGFloat
  private let showIndicator: Bool

  init(
    _ items: [Item],
    spacing: CGFloat,
    height: CGFloat,
    showIndicator: Bool,
    @ViewBuilder content: @escaping (Item) -> Content
  ) {
    self.items = items
    self.height = height
    self.spacing = spacing
    self.showIndicator = showIndicator
    self.content = content
  }

  var body: some View {
    ScrollView(.horizontal, showsIndicators: showIndicator) {
      LazyHStack(spacing: spacing) {
        ForEach(items) { item in
          content(item)
        }
      }
      .frame(maxHeight: height)
    }
  }
}

#if DEBUG
struct HorizontalList_Previews: PreviewProvider {
  static let preview: some View = HorizontalList([
    Prefecture(id: 111, title: "東京都"),
    Prefecture(id: 222, title: "神奈川県"),
    Prefecture(id: 333, title: "千葉県"),
    Prefecture(id: 444, title: "埼玉県"),
    Prefecture(id: 555, title: "茨城県"),
  ], spacing: 6, height: 30, showIndicator: false) { pref in
    Text(pref.title)
  }
  .previewLayout(.fixed(width: 300, height: 100))

  static var previews: some View {
    preview.preferredColorScheme(.light)
    preview.preferredColorScheme(.dark)
  }
}
#endif
