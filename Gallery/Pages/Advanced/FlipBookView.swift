//
//  FlipBookView.swift
//  Gallery
//
//  Created by Taichi Yuki on 2024/07/30.
//

import SwiftUI

struct FlipBookView: View {
  @State var show: Bool = false
  @State var show2: Bool = false
  @State var close: Bool = false
  @State var move: Bool = false

  var body: some View {
    ZStack {
      Color.gray.opacity(0.3).ignoresSafeArea()
      ZStack {
        BookPageView()
        BehindCover(show2: $show2, close: $close)
        Rectangle()
          .foregroundStyle(.black)
          .opacity(0.7)
          .frame(width: 1)
          .frame(height: 264)
          .blur(radius: 5)
          .offset(x: -90)
        BookCover(show: $show)
      }
      .offset(x: move ? 90 : 0)
      .onTapGesture {
        openBookToggle()
      }
    }
  }

  func openBookToggle() {
    if show {
      // close
      withAnimation(.linear(duration: 0.4).delay(0.4)) {
        show.toggle()
      }
      withAnimation(.linear(duration: 0.8)) {
        show2.toggle()
      }
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
        close = true
      }
      withAnimation(.linear(duration: 0.4).delay(0.4)) {
        move.toggle()
      }
    } else {
      // open
      close = false
      withAnimation(.linear(duration: 0.4)) {
        show.toggle()
      }
      withAnimation(.linear(duration: 0.8)) {
        show2.toggle()
      }
      withAnimation(.linear(duration: 0.4).delay(0.4)) {
        move.toggle()
      }
    }
  }
}

struct BookCover: View {
  @Binding var show: Bool

  var body: some View {
    Image(.swiftBookCover)
      .resizable()
//      .scaledToFit()
      .clipShape(bookRectangle())
      .frame(width: 180, height: 264)
      .rotation3DEffect(
        .degrees(show ? -90 : 0),
        axis: (x: 0.0, y: 1.0, z: 0.0),
        anchor: .leading,
        anchorZ: 0,
        perspective: 0.3
      )
  }
}

struct BehindCover: View {
  @Binding var show2: Bool
  @Binding var close: Bool

  var body: some View {
    ZStack {
      bookRectangle()
        .frame(width: 180, height: 264)
        .foregroundStyle(.white)

      VStack {
        Text("SWIFTUI").font(.title.bold())
        VStack {
          Text("450")
          Text("pages")
        }
      }
      .foregroundStyle(.gray)
      .rotation3DEffect(
        .degrees(-180),
        axis: (x: 0.0, y: 1.0, z: 0.0)
      )
    }
    .rotation3DEffect(
      .degrees(show2 ? -180 : 0),
      axis: (x: 0.0, y: 1.0, z: 0.0),
      anchor: .leading,
      anchorZ: 0,
      perspective: 0.3
    )
    .opacity(close ? 0 : 1)
  }
}

struct BookPageView: View {
  var body: some View {
    bookRectangle()
      .frame(width: 180, height: 264)
      .foregroundStyle(.white)

    VStack(alignment: .leading, spacing: 16) {
      Text("Introduction").bold()
        .font(.system(size: 16))
      Text("SwiftUI uses Swift to deliver the best experience for all Apple platforms.AmazinglyLess code, more beautyAppsYou can build it.OneIt was summarized astooland APIs for any Apple device.ExcellentuserWe can provide experiences.")
        .font(.system(size: 8))
        .lineSpacing(5)
    }
    .frame(width: 170, height: 220)
    .foregroundStyle(.gray)
  }
}

private func bookRectangle() -> some Shape {
  UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 0, bottomTrailingRadius: 8, topTrailingRadius: 8, style: .continuous)
}

#Preview {
  FlipBookView()
}
