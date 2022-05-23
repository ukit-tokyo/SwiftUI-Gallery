//
//  SearchNavigationGalleyView.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/23.
//

import SwiftUI

struct SearchNavigationGalleyView: View {
  var body: some View {
    SearchNavigationBar {
      List {
        Section {
          Text("Row")
          Text("Row")
          Text("Row")
          Text("Row")
          Text("Row")
          Text("Row")
          Text("Row")
          Text("Row")
          Text("Row")
          Text("Row")
        }
        Section {
          Text("Row")
          Text("Row")
          Text("Row")
          Text("Row")
          Text("Row")
          Text("Row")
          Text("Row")
          Text("Row")
          Text("Row")
          Text("Row")
        }
      }
    }
  }
}

struct SearchNavigationGalleyView_Previews: PreviewProvider {
  static var previews: some View {
    SearchNavigationGalleyView()
  }
}
