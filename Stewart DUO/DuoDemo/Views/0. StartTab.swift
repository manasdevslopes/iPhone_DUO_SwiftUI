//
// StartTab.swift
// DuoDemo
//
// Created by MANAS VIJAYWARGIYA on 27/10/26.
// ------------------------------------------------------------------------
// Copyright © 2026 BLACENOVA. All rights reserved.
// ------------------------------------------------------------------------
//


import SwiftUI

struct StartTab: View {
    @State private var store = RecipeStore()

    var body: some View {
        TabView {
            Tab("Recipes", systemImage: "fork.knife") {
                RecipeListView()
            }
            Tab("Discover", systemImage: "sparkles") {
                PlaceholderView(title: "Discover", systemImage: "sparkles", message: "Recommended recipes will appear here.")
            }
            Tab("Planner", systemImage: "calendar") {
                PlannerView()
            }
            Tab("Shopping", systemImage: "cart") {
                PlaceholderView(title: "Shopping", systemImage: "cart", message: "Your shopping list is empty.")
            }
            Tab("Settings", systemImage: "gearshape") {
              SettingView()
            }
        }
        .foldGuide()
        .environment(store)
        .tabViewStyle(.sidebarAdaptable)
        .tabBarMinimizeBehavior(.onScrollDown)
    }
}

#Preview {
    StartTab()
}
