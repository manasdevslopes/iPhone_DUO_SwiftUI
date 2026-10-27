//
// PlaceholderView.swift
// DuoDemo
//
// Created by MANAS VIJAYWARGIYA on 27/10/26.
// ------------------------------------------------------------------------
// Copyright © 2026 BLACENOVA. All rights reserved.
// ------------------------------------------------------------------------
//

import SwiftUI

struct PlaceholderView: View {
    let title: String
    let systemImage: String
    let message: String

    var body: some View {
        NavigationStack {
            ContentUnavailableView(title, systemImage: systemImage, description: Text(message))
                .navigationTitle(title)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("More", systemImage: "ellipsis.circle") { print("\(title) more") }
                    }
                }
        }
    }
}

#Preview {
    PlaceholderView(title: "Discover", systemImage: "sparkles", message: "Recommended recipes will appear here.")
}
