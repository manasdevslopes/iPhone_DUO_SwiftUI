//
// ReservedRegions.swift
// Kavsoft DUO
//
// Created by MANAS VIJAYWARGIYA on 26/10/26.
// ------------------------------------------------------------------------
// Copyright © 2026 BLACENOVA. All rights reserved.
// ------------------------------------------------------------------------
//
    

import SwiftUI

struct ReservedRegions: View {
    var body: some View {
      GeometryReader { proxy in
        let divisions = proxy.reservedRegions(kind: .division)
        if let dividedRegion = divisions.first {
          Rectangle()
            .frame(width: dividedRegion.frame.width, height: dividedRegion.frame.height)
            .offset(x: dividedRegion.frame.minX, y: dividedRegion.frame.minY)
        }
      }
    }
}

#Preview {
    ReservedRegions()
}
