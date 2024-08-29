//
//  Snackbar.swift
//  Gallery
//
//  Created by Taichi Yuki on 2024/08/28.
//

import SwiftUI

extension View {
  func snackBar<Label: View>(
    isShowing: Binding<Bool>,
    action: (() -> Void)? = nil,
    @ViewBuilder label: () -> Label
  ) -> some View {

    modifier(
      SnackbarModifier(
        isShown: isShowing,
        action: action,
        label: label)
    )
  }
}

struct SnackbarModifier<Label: View>: ViewModifier {
  @Binding var isShown: Bool
  let action: (() -> Void)?
  let label: Label

  init(
    isShown: Binding<Bool>,
    action: (() -> Void)? = nil,
    @ViewBuilder label: () -> Label
  ) {
    self._isShown = isShown
    self.action = action
    self.label = label()
  }

  func body(content: Content) -> some View {
    content
      .overlay(alignment: .bottom) {
        if isShown {
          label
//            .frame(maxWidth: .infinity, maxHeight: 40)
            .padding(.horizontal, 16)
            .frame(height: 40)
            .shadow(radius: 3)
            .background(.black)
            .clipShape(Capsule())
            .padding(16)
            .offset(x: 0, y: -20)
            .onTapGesture { action?() }
            .transition(
              .opacity.combined(with: .offset(x: 0, y: 20))
            )
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
}

#Preview {
  Rectangle()
    .fill(.white)
    .snackBar(
      isShowing: .constant(true),
      label: {
        Text("This is Snack Bar.")
          .typography(.bodyBold)
          .foregroundStyle(.white)
      })
}
