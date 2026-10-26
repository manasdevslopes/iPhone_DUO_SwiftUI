//
// SplitArrangementLayoutRatio.swift
// Kavsoft DUO
//
// Created by MANAS VIJAYWARGIYA on 26/10/26.
// ------------------------------------------------------------------------
// Copyright © 2026 BLACENOVA. All rights reserved.
// ------------------------------------------------------------------------
//
    

import SwiftUI

struct SplitArrangementLayoutRatio: View {
    var body: some View {
      ArrangementView(primary: {
        Color.red
      }, secondary: {
        Color.blue
          // .splitArrangementLayoutRatio(0.3)
          // .splitArrangementLayoutRatio(maxHorizontal: 0.3, maxVertical: 0.5)
      })
      // .arrangementViewStyle(.split.axes(.horizontal))
      .arrangementViewStyle(.overlay)
    }
}

#Preview {
    SplitArrangementLayoutRatio()
}
