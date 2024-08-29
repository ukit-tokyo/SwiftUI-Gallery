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

    Snackbar(
      isShowing: isShowing,
      presenting: self,
      action: action,
      label: label
    )
  }
}

struct Snackbar<Presenting: View, Label: View>: View {
  @Binding var isShowing: Bool
  private let presenting: AnyView
  private let action: (() -> Void)?
  private let label: Label

  @Environment(\.colorScheme) private var colorScheme: ColorScheme

  init(
    isShowing: Binding<Bool>,
    presenting: Presenting,
    action: (() -> Void)? = nil,
    @ViewBuilder label: () -> Label
  ) {

    self._isShowing = isShowing
    self.presenting = AnyView(presenting)
    self.action = action
    self.label = label()
  }

  var body: some View {
    GeometryReader { geometry in
      ZStack(alignment: .center) {
        presenting

        VStack {
          Spacer()
          if isShowing {
            label
              .frame(maxWidth: geometry.size.width * 0.9, maxHeight: 40)
              .fixedSize(horizontal: true, vertical: false)
              .shadow(radius: 3)
              .background(.black)
              .clipShape(Capsule())
              .offset(x: 0, y: -20)
              .onTapGesture {
                action?()
              }
              .transition(
                .opacity.combined(with: .offset(x: 0, y: 20))
              )
              .task(id: isShowing) {
                guard isShowing else { return }
                try? await Task.sleep(for: .seconds(4))
                withAnimation {
                  isShowing = false
                }
              }
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
        Text("This is Snack Bar. This is Snack Bar. This is Snack Bar.")
          .typography(.bodyBold)
          .foregroundStyle(.white)
          .padding(.horizontal, 16)
      })
}
