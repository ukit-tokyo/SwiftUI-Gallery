//
//  HorizontalListGalleryView.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/08/22.
//

import SwiftUI

struct HorizontalListGalleryView: View {
  struct ListItem: HorizontalListItem {
    let id: Int
    let title: String
    var value: String { title }
  }

  let prefictures: [ListItem] = [
    .init(id: 111, title: "東京都"),
    .init(id: 222, title: "神奈川県"),
    .init(id: 333, title: "千葉県"),
    .init(id: 444, title: "埼玉県"),
    .init(id: 555, title: "茨城県"),
  ]
  let hashtags: [ListItem] = [
    .init(id: 111, title: "ハンバーグ"),
    .init(id: 222, title: "カレー"),
    .init(id: 333, title: "カフェ"),
    .init(id: 444, title: "パスタ"),
    .init(id: 555, title: "チョコレート"),
  ]
  let stations: [ListItem] = [
    .init(id: 111, title: "神保町駅"),
    .init(id: 222, title: "新御茶ノ水駅"),
    .init(id: 333, title: "竹橋駅"),
    .init(id: 444, title: "小川町駅"),
    .init(id: 555, title: "東京駅"),
  ]

  var body: some View {
    VStack(spacing: 16) {
      HorizontalList(
        items: prefictures,
        itemLayout: .init(icon: .mappinAndEllipse, font: .mediumBold)) { preficture in
          print(preficture.value)
        }

      HorizontalList(
        items: hashtags,
        itemLayout: .init(icon: .tag, font: .mediumBold)) { hashtag in
          print(hashtag.value)
        }

      HorizontalList(
        items: stations,
        itemLayout: .init(icon: .tram, font: .mediumBold)) { station in
          print(station.value)
        }

      Spacer()
    }
    .navigationBarTitleDisplayMode(.inline)
    .navigationTitle("Horizontal List")
    .padding(16)
  }
}

#if DEBUG
struct HorizontalListGalleryView_Previews: PreviewProvider {
  static let preview: some View = HorizontalListGalleryView()

  static var previews: some View {
    preview.preferredColorScheme(.light)
    preview.preferredColorScheme(.dark)
  }
}
#endif
