//
// RecipeRow.swift
// DuoDemo
//
// Created by MANAS VIJAYWARGIYA on 27/10/26.
// ------------------------------------------------------------------------
// Copyright © 2026 BLACENOVA. All rights reserved.
// ------------------------------------------------------------------------
//

import SwiftUI

struct RecipeRow: View {
    let recipe: Recipe

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(recipe.name)
                    .font(.headline)
                Text("\(recipe.cuisine) • \(recipe.minutes) min")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            if recipe.isFavorite {
                Image(systemName: "heart.fill")
                    .foregroundStyle(.red)
            }
        }
    }
}
