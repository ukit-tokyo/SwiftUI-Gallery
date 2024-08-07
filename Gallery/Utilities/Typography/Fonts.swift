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
