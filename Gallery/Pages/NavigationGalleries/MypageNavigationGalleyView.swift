//
//  MypageNavigationGalleyView.swift
//  Gallery
//
//  Created by Taichi Yuki on 2022/05/23.
//

import SwiftUI

struct MypageNavigationGalleyView: View {
  var body: some View {
    MypageNavigationBar(
      "Mypage",
      userSearchAction: { print("userSearchAction") },
      hashtagEditAction: { print("hashtagEditAction") },
      settingAction: { print("settingAction") }) {
        Text("This is Mypage")
      }
  }
}

struct MypageNavigationGalleyView_Previews: PreviewProvider {
  static var previews: some View {
    MypageNavigationGalleyView()
  }
}
