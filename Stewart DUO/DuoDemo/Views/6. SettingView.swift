//
// SettingView.swift
// DuoDemo
//
// Created by MANAS VIJAYWARGIYA on 27/10/26.
// ------------------------------------------------------------------------
// Copyright © 2026 BLACENOVA. All rights reserved.
// ------------------------------------------------------------------------
//

import SwiftUI

struct SettingView: View {
  var body: some View {
    NavigationStack {
      if #available(iOS 27.1, *) {
        DuoLabView()
      } else {
        ContentUnavailableView("Settings", systemImage: "gearshape", description: Text("App settings will appear here."))
          .navigationTitle("Settings")
          .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
              Button("More", systemImage: "ellipsis.circle") { print("Settings more") }
            }
          }
      }
    }
  }
}

#Preview {
  SettingView()
}
