//
//  HorizontalFacetList.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/08/22.
//

import SwiftUI

struct HorizontalFacetList<Item: HorizontalListItem>: View {
  private let items: [Item]
  private let icon: Image
  private let selectAction: (Item) -> Void

  init(_ items: [Item],
       icon: Image,
       selectAction: @escaping (Item) -> Void) {
    self.items = items
    self.icon = icon
    self.selectAction = selectAction
  }

  var body: some View {
    HorizontalList(
      items, spacing: 6,
      height: 30, showIndicator: false) { item in
        FillIconTextButton(
          item.title,
          icon: icon,
          theme: .monotone,
          font: .mediumBold,
          height: 30,
          spacing: 2,
          animated: false,
          action: { selectAction(item) }
        )
      }
  }
}

#if DEBUG
struct HorizontalFacetList_Previews: PreviewProvider {
  static let preview: some View = HorizontalFacetList([
    Prefecture(id: 111, title: "東京都"),
    Prefecture(id: 222, title: "神奈川県"),
    Prefecture(id: 333, title: "千葉県"),
    Prefecture(id: 444, title: "埼玉県"),
    Prefecture(id: 555, title: "茨城県"),
  ], icon: .mappinAndEllipse) { pref in
    print(pref.value)
  }
    .previewLayout(.fixed(width: 300, height: 100))

  static var previews: some View {
    preview.preferredColorScheme(.light)
    preview.preferredColorScheme(.dark)
  }
}
#endif
