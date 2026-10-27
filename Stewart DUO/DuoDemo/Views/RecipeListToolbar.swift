//
// RecipeListToolbar.swift
// DuoDemo
//
// Created by MANAS VIJAYWARGIYA on 27/10/26.
// ------------------------------------------------------------------------
// Copyright © 2026 BLACENOVA. All rights reserved.
// ------------------------------------------------------------------------
//
    

import SwiftUI

struct RecipeListToolbar: ToolbarContent {
  
  @Binding var showingAdd: Bool
  
  var body: some ToolbarContent {
    if #available(iOS 27.0, *) {
      adaptiveItems
    } else {
      menuItems
    }
  }
  
  @ToolbarContentBuilder
  private var menuItems: some ToolbarContent {
    ToolbarItem(placement: .topBarLeading) {
      Menu("More", systemImage: "ellipsis.circle") {
        Button("Sort", systemImage: "arrow.up.arrow.down") { print("Sort") }
        Button("Filter", systemImage: "line.3.horizontal.decrease") { print("Filter") }
        Button("Share", systemImage: "square.and.arrow.up") { print("Share list") }
      }
    }
    ToolbarItem(placement: .topBarTrailing) {
      Button("Add", systemImage: "plus") { showingAdd = true }
    }
  }
  
  @available(iOS 27.0, *)
  @ToolbarContentBuilder
  private var adaptiveItems: some ToolbarContent {
    ToolbarItem(placement: .topBarTrailing) {
      Button("Sort", systemImage: "arrow.up.arrow.down") { print("Sort") }
    }
    ToolbarItem(placement: .topBarTrailing) {
      Button("Filter", systemImage: "line.3.horizontal.decrease") { print("Filter") }
    }
    .visibilityPriority(.high)
    ToolbarItem(placement: .topBarTrailing) {
      Button("Share", systemImage: "square.and.arrow.up") { print("Share list") }
    }
    
    ToolbarItem(placement: .topBarTrailing) {
      Button("Add", systemImage: "plus") { showingAdd = true }
    }
    .horizontalToolbarButton()
    .visibilityPriority(.high)
  }
  
}

extension ToolbarItem {
  @ViewBuilder
  func horizontalToolbarButton() -> some ToolbarContent {
    if #available(iOS 27.1, *) {
      axisBehavior(.horizontalOnly)
    } else {
      self
    }
  }
}
