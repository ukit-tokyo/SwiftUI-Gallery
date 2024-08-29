//
//  InstantMessageView.swift
//  Gallery
//
//  Created by Taichi Yuki on 2024/08/30.
//

import SwiftUI

extension View {
  func instantMessage(
    isShown: Binding<Bool>,
    type: InstantMessageView.MessageType? = nil,
    message: String
  ) -> some View {

    modifier(
      InstantMessageModifier(
        isShown: isShown,
        type: type,
        message: message
      )
    )
  }
}

struct InstantMessageModifier: ViewModifier {
  @Binding var isShown: Bool
  let type: InstantMessageView.MessageType?
  let message: String

  func body(content: Content) -> some View {
    content
      .overlay {
        InstantMessageView(type: type, message: message)
          .opacity(isShown ? 1 : 0)
          .task(id: isShown) {
            guard isShown else { return }
            try? await Task.sleep(for: .seconds(4))
            withAnimation {
              isShown = false
            }
          }
      }
  }
}

struct InstantMessageView: View {
  enum MessageType {
    case error

    var icon: Image {
      switch self {
      case .error: Image(systemName: "xmark")
      }
    }
  }

  let type: MessageType?
  let message: String

  var body: some View {
    VStack(spacing: 8) {
      if let type {
        type.icon
          .font(.largeTitle)
          .foregroundStyle(.white)
      }
      Text(message)
        .typography(.subBody)
        .lineLimit(nil)
        .multilineTextAlignment(.center)
        .foregroundStyle(.white)
    }
    .padding(16)
    .background(.black.opacity(0.5))
    .clipShape(RoundedRectangle(cornerRadius: 8))
    .frame(maxWidth: 200, maxHeight: .infinity)
  }
}

#Preview {
  Rectangle().fill(.blue)
    .instantMessage(
      isShown: .constant(true),
      type: .error,
      message: "This is an error message."
    )
}
