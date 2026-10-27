//
// 9. DuoLabView.swift
// DuoDemo
//
// Created by MANAS VIJAYWARGIYA on 27/10/26.
// ------------------------------------------------------------------------
// Copyright © 2026 BLACENOVA. All rights reserved.
// ------------------------------------------------------------------------
//
    

import SwiftUI

/// A small instrument panel for the iPhone Duo APIs: hinge state and reserved regions.
@available(iOS 27.1, *)
struct DuoLabView: View {
  @State private var hingeStatus = "Fold or unfold to update"
  @State private var hingeAngle: Angle?
  @AppStorage(showFoldGuideKey) private var showFoldGuide = false
  
  var body: some View {
    NavigationStack {
      GeometryReader { proxy in
        List {
          Section("Hinge") {
            LabeledContent("Status", value: hingeStatus)
            LabeledContent("Angle", value: hingeAngle.map { "\(Int($0.degrees))°" } ?? "–")
          }
          Section("Fold guide") {
            Toggle("Show the fold on every screen", isOn: $showFoldGuide)
          }
          Section("This view (origin for every x and y below)") {
            LabeledContent("Size", value: "\(Int(proxy.size.width)) × \(Int(proxy.size.height))")
            LabeledContent("Safe area", value: insetsText(proxy.safeAreaInsets))
          }
          Section("Division regions (the fold)") {
            regionRows(proxy.reservedRegions(kind: .division, options: .includeInactive))
          }
          Section("Occlusion regions (cameras)") {
            regionRows(proxy.reservedRegions(kind: .occlusion, options: .includeInactive))
          }
        }
      }
      .navigationTitle("Duo Lab")
    }
    .onHingeChange { _, new in
      guard let hinge = new.hinge else {
        hingeStatus = "No hinge"
        hingeAngle = nil
        return
      }
      hingeAngle = hinge.angle
      if hinge.status == .closed {
        hingeStatus = "Closed"
      } else if hinge.status == .partiallyOpen {
        hingeStatus = "Partially open"
      } else if hinge.status == .fullyOpen {
        hingeStatus = "Fully open"
      } else {
        hingeStatus = "Unknown"
      }
    }
  }
  
  @ViewBuilder
  private func regionRows(_ regions: [ReservedRegion]) -> some View {
    if regions.isEmpty {
      Text("None").foregroundStyle(.secondary)
    }
    ForEach(regions) { region in
      VStack(alignment: .leading, spacing: 4) {
        Text(region.isActive ? "Active" : "Inactive")
          .font(.subheadline.weight(.semibold))
        // frame includes the margins
        Text("Frame: \(rectText(region.frame))")
        Text("Margins: \(insetsText(region.margins))")
        // frame minus margins = the actual obstruction
        Text("Reserved rect: \(rectText(inset(region.frame, by: region.margins)))")
      }
      .font(.caption)
    }
  }
  
  private func inset(_ rect: CGRect, by margins: EdgeInsets) -> CGRect {
    CGRect(x: rect.minX + margins.leading,
           y: rect.minY + margins.top,
           width: rect.width - margins.leading - margins.trailing,
           height: rect.height - margins.top - margins.bottom)
  }
  
  private func rectText(_ rect: CGRect) -> String {
    "x \(Int(rect.minX)), y \(Int(rect.minY)), \(Int(rect.width)) × \(Int(rect.height))"
  }
  
  private func insetsText(_ insets: EdgeInsets) -> String {
    "top \(Int(insets.top)), leading \(Int(insets.leading)), bottom \(Int(insets.bottom)), trailing \(Int(insets.trailing))"
  }
}
