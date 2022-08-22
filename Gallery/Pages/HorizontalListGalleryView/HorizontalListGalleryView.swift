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
    VStack(spacing: 42) {
      VStack(spacing:16) {
        Text("Facet Lists")
          .font(.largeBold)
        HorizontalFacetList(
          prefictures,
          icon: .mappinAndEllipse) { preficture in
            print(preficture.value)
          }
        HorizontalFacetList(
          hashtags,
          icon: .tag) { hashtag in
            print(hashtag.value)
          }
        HorizontalFacetList(
          stations,
          icon: .tram) { station in
            print(station.value)
          }
      }

      VStack(spacing:16) {
        Text("Custom Lists")
          .font(.largeBold)

        HorizontalList(
          prefictures, spacing: 6,
          height: 45, showIndicator: false) { preficture in
            FillIconTextButton(
              preficture.title,
              icon: .mappinAndEllipse,
              theme: .primary,
              font: .largeBold,
              height: 45,
              spacing: 4,
              animated: false,
              action: {
                print(preficture.value)
              }
            )
          }
        HorizontalList(
          hashtags, spacing: 24,
          height: 45, showIndicator: true) { hashtag in
            BorderButton(
              theme: .primary,
              font: .largeBold,
              borderWidth: 2,
              height: 44,
              cornerRadius: 10,
              action: { _ in print(hashtag.value) },
              label: {
                Text(hashtag.title)
              })
          }
        HorizontalList(
          stations, spacing: 16,
          height: 45, showIndicator: true) { hashtag in
            BorderIconButton(
              .swift,
              theme: .monotone,
              borderWidth: 2,
              size: 40,
              iconSize: 20,
              action: { _ in })
          }
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
