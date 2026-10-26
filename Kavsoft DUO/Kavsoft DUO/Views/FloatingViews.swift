//
// FloatingViews.swift
// Kavsoft DUO
//
// Created by MANAS VIJAYWARGIYA on 26/10/26.
// ------------------------------------------------------------------------
// Copyright © 2026 BLACENOVA. All rights reserved.
// ------------------------------------------------------------------------
//
    

import SwiftUI

struct FloatingViews: View {
    var body: some View {
      ArrangementView(primary: {
        FloatingView()
      }, secondary: {
        Color.blue
      })
      .arrangementViewStyle(.overlay)
    }
}

struct FloatingView: View {
  @Environment(\.overlayArrangementZIndex) var zIndex
  
  var body: some View {
    RoundedRectangle(cornerRadius: 20)
      .frame(width: zIndex > 0 ? 100 : nil, height: zIndex > 0 ? 50 : nil)
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
  }
}

#Preview {
    FloatingViews()
}
