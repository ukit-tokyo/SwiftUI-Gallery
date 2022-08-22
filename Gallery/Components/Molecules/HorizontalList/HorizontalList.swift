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

struct HorizontalList<Item: HorizontalListItem>: View {
  private let items: [Item]
  private let height: CGFloat?
  private let itemLayout: ItemLayout
  private let spacing: CGFloat?
  private let showIndicator: Bool
  private let selectAction: (Item) -> Void

  init(
    items: [Item],
    itemLayout: ItemLayout,
    spacing: CGFloat? = nil,
    showIndicator: Bool = false,
    selectAction: @escaping (Item) -> Void
  ) {
    self.items = items
    self.itemLayout = itemLayout
    self.height = itemLayout.height
    self.spacing = spacing
    self.showIndicator = showIndicator
    self.selectAction = selectAction
  }

  var body: some View {
    ScrollView(.horizontal, showsIndicators: showIndicator) {
      LazyHStack(spacing: spacing ?? 6) {
        ForEach(items) { item in
          FillIconTextButton(
            item.title,
            icon: itemLayout.icon,
            theme: .monotone,
            font: itemLayout.font,
            height: itemLayout.height ?? 30,
            spacing: itemLayout.spacing ?? 2,
            animated: false,
            action: { selectAction(item) }
          )
        }
      }
      .frame(maxHeight: height ?? 30)
    }
  }
}

extension HorizontalList {
  struct ItemLayout {
    let icon: Image
    let font: Font
    let spacing: CGFloat?
    let height: CGFloat?

    init(
      icon: Image,
      font: Font,
      spacing: CGFloat? = nil,
      height: CGFloat? = nil
    ) {
      self.icon = icon
      self.font = font
      self.spacing = spacing
      self.height = height
    }
  }
}

#if DEBUG
struct HorizontalList_Previews: PreviewProvider {
  static let preview: some View = HorizontalList(
    items: [
      Prefecture(id: 111, title: "東京都"),
      Prefecture(id: 222, title: "神奈川県"),
      Prefecture(id: 333, title: "千葉県"),
      Prefecture(id: 444, title: "埼玉県"),
      Prefecture(id: 555, title: "茨城県"),
    ],
    itemLayout: .init(
      icon: .magnifyingglass,
      font: .mediumBold
    ),
    selectAction: { preficture in
      print(preficture.value)
    })
    .previewLayout(.fixed(width: 300, height: 100))

  static var previews: some View {
    preview.preferredColorScheme(.light)
    preview.preferredColorScheme(.dark)
  }
}
#endif
