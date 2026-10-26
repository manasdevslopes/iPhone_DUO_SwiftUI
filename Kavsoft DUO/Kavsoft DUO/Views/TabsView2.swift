//
// TabsView2.swift
// Kavsoft DUO
//
// Created by MANAS VIJAYWARGIYA on 26/10/26.
// ------------------------------------------------------------------------
// Copyright © 2026 BLACENOVA. All rights reserved.
// ------------------------------------------------------------------------
//


import SwiftUI

struct TabsView2: View {
  var body: some View {
    TabView {
      Tab.init("Home", systemImage: "house") {
        NavigationStack {
          ScrollView {
            
          }
          .toolbar {
            ToolbarItem {
              Button("Add", systemImage: "plus") {
                
              }
            }
            .axisBehavior(.horizontalOnly) // .horizontalOnly .verticalPreferred .automatic
            
            ToolbarItem {
              Button("Add", systemImage: "plus") {
                
              }
            }
            
            ToolbarItem {
              Button("Add", systemImage: "plus") {
                
              }
            }
            
            ToolbarItem {
              Button("Add", systemImage: "plus") {
                
              }
            }
            
            ToolbarItem {
              Button("Add", systemImage: "plus") {
                
              }
            }
            
            ToolbarItem {
              Button("Add", systemImage: "plus") {
                
              }
            }
            
            ToolbarItem {
              Button("Add", systemImage: "plus") {
                
              }
            }
          }
          .toolbarVerticalCompressionBehavior(.prefersToolbarItems) // .prefersToolbarItems .prefersTabBar .automatic
        }
      }
      
      Tab.init("Favorites", systemImage: "suit.heart") {
        
      }
      
      Tab.init("Settings", systemImage: "gear") {
        
      }
    }
  }
}

#Preview {
  TabsView2()
}
