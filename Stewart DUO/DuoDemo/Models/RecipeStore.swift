//
// RecipeStore.swift
// DuoDemo
//
// Created by MANAS VIJAYWARGIYA on 27/10/26.
// ------------------------------------------------------------------------
// Copyright © 2026 BLACENOVA. All rights reserved.
// ------------------------------------------------------------------------
//

import Foundation
import Observation

@Observable
final class RecipeStore {
    var recipes: [Recipe]

    init(recipes: [Recipe] = Recipe.samples) {
        self.recipes = recipes
    }

    func add(_ recipe: Recipe) {
        recipes.insert(recipe, at: 0)
    }

    func update(_ recipe: Recipe) {
        guard let index = recipes.firstIndex(where: { $0.id == recipe.id }) else { return }
        recipes[index] = recipe
    }

    func delete(_ recipe: Recipe) {
        recipes.removeAll { $0.id == recipe.id }
    }

    func toggleFavorite(_ recipe: Recipe) {
        guard let index = recipes.firstIndex(where: { $0.id == recipe.id }) else { return }
        recipes[index].isFavorite.toggle()
    }
}
