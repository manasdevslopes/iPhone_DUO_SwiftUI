//
// OverlayArrangementEdge.swift
// Kavsoft DUO
//
// Created by MANAS VIJAYWARGIYA on 26/10/26.
// ------------------------------------------------------------------------
// Copyright © 2026 BLACENOVA. All rights reserved.
// ------------------------------------------------------------------------
//
    

import SwiftUI

struct OverlayArrangementEdge: View {
  var body: some View {
    ArrangementView(primary: {
      FloatingView1()
        .overlayArrangementEdge(.leading)
    }, secondary: {
      Color.blue
        .overlayArrangementEdge(.trailing)
    })
    .arrangementViewStyle(.overlay)
  }
}

struct FloatingView1: View {
  var body: some View {
    RoundedRectangle(cornerRadius: 20)
      .frame(width: 100, height: 100)
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
  }
}

#Preview {
    OverlayArrangementEdge()
}
