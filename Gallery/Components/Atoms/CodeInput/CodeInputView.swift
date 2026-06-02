//
//  CodeInputView.swift
//  Gallery
//
//  Created by Taichi Yuki on 2026/06/02.
//

import SwiftUI

struct CodeInputView: View {
  @State
  private var code: String = ""
  @State
  private var isError: Bool = false
  @FocusState
  private var isFocused: Bool

  private let codeLength = 6

  var body: some View {
    ZStack {
      // 表示用のセル
      HStack(spacing: 8) {
        ForEach(0..<codeLength, id: \.self) { index in
          CodeCellView(
            character: code.count > index
              ? String(code[code.index(code.startIndex, offsetBy: index)]) : nil,
            isFocused: isFocused && code.count == index,
            isError: isError
          )
        }
      }

      // 全体を覆う透明なTextFieldで入力とペーストを処理
      TextField("", text: $code)
        .keyboardType(.asciiCapable)
        .textInputAutocapitalization(.characters)
        .autocorrectionDisabled()
        .focused($isFocused)
        .foregroundColor(.clear)
        .accentColor(.clear)
        .background(Color.clear)
        .onChange(of: code) { newValue in
          // 6文字制限
          if newValue.count > codeLength {
            code = String(newValue.prefix(codeLength))
          }
          // 大文字に変換
          code = code.uppercased()
          // エラーをリセット
          if isError {
            isError = false
          }
        }
    }
    .onAppear {
      isFocused = true
    }
  }
}

struct CodeCellView: View {
  let character: String?
  let isFocused: Bool
  let isError: Bool

  @State
  private var showCaret = true

  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 10)
        .fill(cellBackgroundColor)
        .overlay {
          RoundedRectangle(cornerRadius: 10)
            .strokeBorder(cellBorderColor, lineWidth: cellBorderWidth)
        }

      if let character = character {
        Text(character)
          .font(.system(size: 22, weight: .medium, design: .monospaced))
          .foregroundStyle(characterColor)
      } else if isFocused {
        // キャレットを独自実装
        Rectangle()
          .fill(Color.label)
          .frame(width: 1.5, height: 26)
          .clipShape(RoundedRectangle(cornerRadius: 1))
          .opacity(showCaret ? 1 : 0)
          .onAppear {
            withAnimation(.linear(duration: 0.5).repeatForever(autoreverses: true)) {
              showCaret.toggle()
            }
          }
      } else {
        Text("・")
          .font(.system(size: 10))
          .foregroundStyle(Color.labelTertiary)
      }
    }
    .frame(width: 44, height: 54)
  }

  private var cellBackgroundColor: Color {
    guard isFocused else {
      return .clear
    }
    return .labelTertiary.opacity(0.1)
  }

  private var cellBorderColor: Color {
    if isError {
      return .primary
    } else if character != nil || isFocused {
      return .label
    } else {
      return .labelTertiary
    }
  }

  private var cellBorderWidth: CGFloat {
    guard character != nil || isFocused else {
      return 1.5
    }
    return 2
  }

  private var characterColor: Color {
    guard isError else {
      return .label
    }
    return .primary
  }
}

#Preview {
  CodeInputView()
}
