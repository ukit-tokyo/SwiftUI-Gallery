//
//  RatingStarView.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/07/22.
//

import SwiftUI

struct RatingStarView: UIViewRepresentable {
  private let iconSize: Float
  private let padding: Float
  private let stepInterval: Float
  private let minimumValue: Float
  private let onSlided: ((Float) -> ())?

  @Binding var value: Float

  init(
    value: Binding<Float>,
    iconSize: Float,
    padding: Float,
    stepInterval: Float = 0.5,
    minimumValue: Float = 0.0,
    onSlided: ((Float) -> ())? = nil
  ) {
    self._value = value
    self.iconSize = iconSize
    self.padding = padding
    self.stepInterval = stepInterval
    self.minimumValue = minimumValue
    self.onSlided = onSlided
  }

  func makeUIView(context: Context) -> AXRatingView {
    let ratingView = AXRatingView()
    ratingView.maskImage = UIImage(named: "Star")
    ratingView.markImage = UIImage(named: "StarBase")
    ratingView.backgroundColor = .clear
    ratingView.iconSize = iconSize
    ratingView.padding = padding
    ratingView.stepInterval = stepInterval
    ratingView.minimumValue = minimumValue
    ratingView.isUserInteractionEnabled = onSlided != nil
    ratingView.addTarget(
      context.coordinator,
      action: #selector(Coordinator.onSlided(_:)),
      for: .valueChanged
    )
    return ratingView
  }

  func updateUIView(_ uiView: AXRatingView, context: Context) {
    uiView.value = value
  }
}

// MARK: - Coordinator
extension RatingStarView {
  final class Coordinator {
    @Binding var value: Float
    private let onSlided: ((Float) -> ())?

    init(
      value: Binding<Float>,
      onSlided: ((Float) -> ())? = nil
    ) {
      self._value = value
      self.onSlided = onSlided
    }

    @objc func onSlided(_ sender: AXRatingView) {
      self.onSlided?(sender.value)
      self.value = sender.value
    }
  }

  func makeCoordinator() -> Coordinator {
    Coordinator(value: $value, onSlided: onSlided)
  }
}

// MARK: - Preview
//#if DEBUG
//struct RatingStarView_Previews: PreviewProvider {
//  static let preview: some View = RatingStarView(iconSize: 30, padding: 8)
//
//  static var previews: some View {
//    preview
//      .previewLayout(.fixed(width: 300, height: 100))
//      .preferredColorScheme(.light)
//
//    preview
//      .previewLayout(.fixed(width: 300, height: 100))
//      .preferredColorScheme(.dark)
//  }
//}
//#endif
