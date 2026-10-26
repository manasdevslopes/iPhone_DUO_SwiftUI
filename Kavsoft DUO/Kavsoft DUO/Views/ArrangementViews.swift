//
// ArrangementViews.swift
// Kavsoft DUO
//
// Created by MANAS VIJAYWARGIYA on 26/10/26.
// ------------------------------------------------------------------------
// Copyright © 2026 BLACENOVA. All rights reserved.
// ------------------------------------------------------------------------
//
    

import SwiftUI

struct ArrangementViews: View {
    var body: some View {
        ArrangementView(primary: {
          Color.red
        }, secondary: {
          Color.blue
        })
    }
}

#Preview {
    ArrangementViews()
}
