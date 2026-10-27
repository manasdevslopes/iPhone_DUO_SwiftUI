//
// FoldGuide.swift
// DuoDemo
//
// Created by MANAS VIJAYWARGIYA on 27/10/26.
// ------------------------------------------------------------------------
// Copyright © 2026 BLACENOVA. All rights reserved.
// ------------------------------------------------------------------------
//
    

import SwiftUI

extension View {
  /// Draws the fold on top of this view when the "Show fold guide" switch (Settings tab) is on.
  /// iOS 27.1+ only; on older systems it does nothing.
  @ViewBuilder
  func foldGuide() -> some View {
    if #available(iOS 27.1, *) {
      modifier(FoldGuideModifier())
    } else {
      self
    }
  }
}

/// UserDefaults key shared by the switch in the Duo Lab and the overlay below.
let showFoldGuideKey = "showFoldGuide"

@available(iOS 27.1, *)
private struct FoldGuideModifier: ViewModifier {
  @AppStorage(showFoldGuideKey) private var showFoldGuide = false
  
  func body(content: Content) -> some View {
    content.overlay {
      if showFoldGuide {
        GeometryReader { proxy in
          // Regions are reported in this reader's own coordinate space,
          // so they can be drawn here without converting anything.
          ForEach(proxy.reservedRegions(kind: .division, options: .includeInactive)) { region in
            FoldGuideShape(region: region)
          }
        }
        .ignoresSafeArea()
        .allowsHitTesting(false)
      }
    }
  }
}

@available(iOS 27.1, *)
private struct FoldGuideShape: View {
  let region: ReservedRegion
  
  /// The frame minus its margins: the fold itself (zero width on this device).
  private var line: CGRect {
    let m = region.margins
    return CGRect(x: region.frame.minX + m.leading,
                  y: region.frame.minY + m.top,
                  width: region.frame.width - m.leading - m.trailing,
                  height: region.frame.height - m.top - m.bottom)
  }
  
  var body: some View {
    ZStack(alignment: .topLeading) {
      // Keep-out band: the frame, margins included
      Rectangle()
        .fill(Color.purple.opacity(0.18))
        .frame(width: region.frame.width, height: region.frame.height)
        .offset(x: region.frame.minX, y: region.frame.minY)
      // The fold: a line at the reserved rect (solid when active, dashed when not)
      Path { path in
        if line.width < line.height {
          path.move(to: CGPoint(x: line.midX, y: line.minY))
          path.addLine(to: CGPoint(x: line.midX, y: line.maxY))
        } else {
          path.move(to: CGPoint(x: line.minX, y: line.midY))
          path.addLine(to: CGPoint(x: line.maxX, y: line.midY))
        }
      }
      .stroke(Color.purple, style: StrokeStyle(lineWidth: 3, dash: region.isActive ? [] : [8, 6]))
    }
  }
}
