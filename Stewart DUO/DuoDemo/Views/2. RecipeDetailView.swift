///
// RecipeDetailView.swift
// DuoDemo
//
// Created by MANAS VIJAYWARGIYA on 27/10/26.
// ------------------------------------------------------------------------
// Copyright © 2026 BLACENOVA. All rights reserved.
// ------------------------------------------------------------------------
//

import SwiftUI

struct RecipeDetailView: View {
    @Environment(RecipeStore.self) private var store
    let recipe: Recipe
    @State private var editing = false

    /// Always show the latest version held by the store.
    private var current: Recipe {
        store.recipes.first { $0.id == recipe.id } ?? recipe
    }

    var body: some View {
        List {
            Section {
                LabeledContent("Cuisine", value: current.cuisine)
                LabeledContent("Time", value: "\(current.minutes) min")
                LabeledContent("Favorite", value: current.isFavorite ? "Yes" : "No")
            }
            Section("Notes") {
                Text(current.notes.isEmpty ? "No notes" : current.notes)
            }
        }
        .navigationTitle(current.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Edit") { editing = true }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Favorite", systemImage: current.isFavorite ? "heart.fill" : "heart") {
                    store.toggleFavorite(current)
                }
            }
        }
        .sheet(isPresented: $editing) {
            RecipeFormView(recipe: current)
        }
    }
}
