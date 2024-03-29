//
//  RatingStarGalleryView.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/07/22.
//

import SwiftUI

struct RatingStarGalleryView: View {
  @State private var value: Float = 0.0
  @State private var value2: Float = 0.0

  var body: some View {
    VStack(spacing: 30) {
      Group {
        Text("Value : \(String(value))")
          .font(.largeBold)

        HStack {
          RatingStarView(
            value: $value,
            iconSize: 30,
            padding: 8) { value in
              print("testing...", value)
            }
            .frame(maxWidth: 182, maxHeight: 30, alignment: .center)
          Spacer(minLength: 100)
        }

        HStack {
          RatingStarView(
            value: $value,
            iconSize: 30,
            padding: 8)
          .frame(maxWidth: 182, maxHeight: 30, alignment: .center)
          Spacer(minLength: 100)
        }

        HStack {
          RatingStarView(
            value: $value,
            iconSize: 20,
            padding: 4) { value in
              print("testing...", value)
            }
            .frame(maxWidth: 182, maxHeight: 30, alignment: .center)
          Spacer(minLength: 100)
        }
      }

      Group {
        RatingScoreStarView(
          value: $value2,
          iconSize: 30,
          iconPadding: 8,
          viewSpacing: 12) { value in
            print(value)
          }
      }

      Spacer()
    }
    .navigationBarTitleDisplayMode(.inline)
    .navigationTitle("Rating Star")
  }
}

struct RatingStarGalleryView_Previews: PreviewProvider {
  static var previews: some View {
    RatingStarGalleryView()
  }
}
