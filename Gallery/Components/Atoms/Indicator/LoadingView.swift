//
//  LoadingView.swift
//  Gallery
//
//  Created by Taichi Yuki on 2024/08/29.
//

import SwiftUI

extension View {
  func loadingOverlay(isLoading: Bool, covered: Bool = true) -> some View {
    ModifiedContent(
      content: self,
      modifier: LoadingViewModifier(isLoading: isLoading, covered: covered)
    )
  }
}

struct LoadingViewModifier: ViewModifier {
  let isLoading: Bool
  let covered: Bool

  var opacity: Double {
    isLoading ? 1 : 0
  }

  func body(content: Content) -> some View {
    content
      .overlay {
        ZStack {
          if covered {
            Rectangle()
              .fill(.clear)
              .contentShape(Rectangle()) // for tappable
              .frame(maxWidth: .infinity, maxHeight: .infinity)
          }
          LoadingView()
        }
        .opacity(opacity)
      }
  }
}

struct LoadingView: View {
  var body: some View {
    ProgressView()
      .progressViewStyle(.circular)
      .padding()
      .tint(.white)
      .background(.black.opacity(0.5))
      .cornerRadius(8)
      .scaleEffect(1.2)
  }
}

#Preview {
  Rectangle()
    .fill(.blue)
    .frame(width: .infinity, height: .infinity)
    .ignoresSafeArea()
    .loadingOverlay(isLoading: true)
}
