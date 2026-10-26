//
// TabsView.swift
// Kavsoft DUO
//
// Created by MANAS VIJAYWARGIYA on 26/10/26.
// ------------------------------------------------------------------------
// Copyright © 2026 BLACENOVA. All rights reserved.
// ------------------------------------------------------------------------
//
    

import SwiftUI

struct TabsView: View {
    var body: some View {
      TabView {
        Tab.init("Home", systemImage: "house") {
          
        }
        
        Tab.init("Favorites", systemImage: "suit.heart") {
          
        }
        
        Tab.init("Settings", systemImage: "gear") {
          
        }
      }
      .toolbarVerticalBehavior(.disabled)
    }
}

#Preview {
    TabsView()
}
