//
// DeviceHingeOnHingeChange.swift
// Kavsoft DUO
//
// Created by MANAS VIJAYWARGIYA on 26/10/26.
// ------------------------------------------------------------------------
// Copyright © 2026 BLACENOVA. All rights reserved.
// ------------------------------------------------------------------------
//
    

import SwiftUI

struct DeviceHingeOnHingeChange: View {
  @State private var hinge: DeviceHinge?
  
  var body: some View {
    VStack {
      if let hinge {
        // hinge.angle or hinge.status
        switch hinge.status {
          case .closed: Text("Closed")
          case .partiallyOpen: Text("Partial Open")
          case .fullyOpen: Text("Fully Open")
          default: Text("Unknown")
        }
        
        Text("Angle: \(hinge.angle.degrees)")
      }
    }
    .onHingeChange { oldContext, newContext in
      hinge = newContext.hinge
    }
  }
}

#Preview {
    DeviceHingeOnHingeChange()
}
