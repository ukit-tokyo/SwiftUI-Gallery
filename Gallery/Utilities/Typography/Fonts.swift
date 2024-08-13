//
//  Fonts.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/26.
//

import SwiftUI

extension Font {
  static func large(_ weight: Font.Weight) -> Font {
    Font.system(size: 17.0, weight: weight)
  }

  static func medium(_ weight: Font.Weight) -> Font {
    Font.system(size: 14.0, weight: weight)
  }

  static func small(_ weight: Font.Weight) -> Font {
    Font.system(size: 12.0, weight: weight)
  }

  static var largeNormal: Font { large(.regular) }
  static var largeBold: Font { large(.bold) }

  static var mediumNormal: Font { medium(.regular) }
  static var mediumBold: Font { medium(.bold) }

  static var smallNormal: Font { small(.regular) }
  static var smallBold: Font { small(.bold) }
}

extension UIFont {

  var bold: UIFont { .boldSystemFont(ofSize: self.pointSize) }

  static let display: UIFont = .boldSystemFont(ofSize: 24)
  static let title: UIFont = .boldSystemFont(ofSize: 20)
  static let subtitle: UIFont = .boldSystemFont(ofSize: 18)

  static let body: UIFont = .systemFont(ofSize: 16)
  static let subBody: UIFont = .systemFont(ofSize: 14)
  static let caption: UIFont = .systemFont(ofSize: 12)
  static let subCaption: UIFont = .systemFont(ofSize: 10)
}

// MARK: - Typography

struct Typography {
  let font: UIFont
  let lineHeight: CGFloat

  static let display: Self = .init(font: .display, lineHeight: 36)
  static let title: Self = .init(font: .title, lineHeight: 32)
  static let subtitle: Self = .init(font: .subtitle, lineHeight: 28)
  static let bodyBold: Self = .init(font: .body.bold, lineHeight: 24)
  static let body: Self = .init(font: .body, lineHeight: 24)
  static let subBodyBold: Self = .init(font: .subBody.bold, lineHeight: 20)
  static let subBody: Self = .init(font: .subBody, lineHeight: 20)
  static let captionBold: Self = .init(font: .caption.bold, lineHeight: 16)
  static let caption: Self = .init(font: .caption, lineHeight: 16)
  static let subCaptionBold: Self = .init(font: .subCaption.bold, lineHeight: 12)
  static let subCaption: Self = .init(font: .subCaption, lineHeight: 12)
}

struct TypographyModifier: ViewModifier {
  let font: UIFont
  let lineHeight: CGFloat

  init(font: UIFont, lineHeight: CGFloat) {
    self.font = font
    self.lineHeight = lineHeight
  }

  init(_ typography: Typography) {
    self.font = typography.font
    self.lineHeight = typography.lineHeight
  }

  func body(content: Content) -> some View {
    content
      .font(Font(font))
      .lineSpacing(lineHeight - font.lineHeight)
      .padding(.vertical, (lineHeight - font.lineHeight) / 2)
  }
}

extension View {
  func typography(font: UIFont, lineHeight: CGFloat) -> some View {
    ModifiedContent(
      content: self,
      modifier: TypographyModifier(font: font, lineHeight: lineHeight)
    )
  }

  func typography(_ typography: Typography) -> some View {
    ModifiedContent(
      content: self,
      modifier: TypographyModifier(typography)
    )
  }
}
