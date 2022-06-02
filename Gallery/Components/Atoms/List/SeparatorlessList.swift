//
//  SeparatorlessList.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/30.
//

import SwiftUI

/// セパレーターなしの List
/// TODO: init の定義が不十分
struct SeparatorlessList<Data, ID, RowContent>: View
  where Data: RandomAccessCollection, ID: Hashable, RowContent: View {

  private let data: Data
  private let id: KeyPath<Data.Element, ID>
  private let rowContent: (Data.Element) -> RowContent

  init(
    _ data: Data,
    id: KeyPath<Data.Element, ID>,
    @ViewBuilder content: @escaping (Data.Element) -> RowContent
  ) {
    self.data = data
    self.id = id
    self.rowContent = content
  }

  var body: some View {
    if #available(iOS 15.0, *) {
      List(data, id: id) { item in
        rowContent(item)
          .listRowSeparator(.hidden)
      }
    } else if #available(iOS 14.0, *) {
      ScrollView {
        LazyVStack {
          ForEach(data, id: id, content: rowContent)
        }
      }
    } else {
      List(data, id: id, rowContent: rowContent)
        .onAppear {
          UITableView.appearance().separatorStyle = .none
        }.onDisappear {
          UITableView.appearance().separatorStyle = .singleLine
        }
    }
  }
}

struct SeparatorlessList_Previews: PreviewProvider {
  static var previews: some View {
    SeparatorlessList(1...10, id: \.self) { element in
      HStack {
        Text("List item \(element)")
        Spacer()
        Image(systemName: "chevron.right")
      }
    }
  }
}
