//
// PlannerView.swift
// DuoDemo
//
// Created by MANAS VIJAYWARGIYA on 27/10/26.
// ------------------------------------------------------------------------
// Copyright © 2026 BLACENOVA. All rights reserved.
// ------------------------------------------------------------------------
//

import SwiftUI

struct PlannerView: View {
  var body: some View {
    NavigationStack {
      Group {
        if #available(iOS 27.1, *) {
          FoldAwarePlanner()
        } else {
          CombinedPlanner()
        }
      }
      .navigationTitle("Planner")
    }
  }
}

@available(iOS 27.1, *)
private struct FoldAwarePlanner: View {
  var body: some View {
    GeometryReader { proxy in
      if proxy.reservedRegions(kind: .division, options: .includeInactive).isEmpty {
        CombinedPlanner()
      } else {
        ArrangementView(primary: {
          List {
            WeekSection()
          }
          .padding(.horizontal)
        }, secondary: {
          List {
            ShoppingSection()
          }
          .padding(.horizontal)
        })
        .background(Color(uiColor: .systemGroupedBackground).ignoresSafeArea())
      }
    }
  }
}

private struct CombinedPlanner: View {
  var body: some View {
    List {
      WeekSection()
      ShoppingSection()
    }
  }
}

private struct WeekSection: View {
  private let week = [
    ("Monday", "Margherita Pizza"),
    ("Tuesday", "Pad Thai"),
    ("Wednesday", "Chicken Tikka Masala"),
    ("Thursday", "Beef Tacos"),
    ("Friday", "Miso Soup"),
    ("Saturday", "Paella"),
    ("Sunday", "Pho")
  ]
  
  var body: some View {
    Section("This Week") {
      ForEach(week, id: \.0) { day, meal in
        LabeledContent(day, value: meal)
      }
    }
  }
}

private struct ShoppingSection: View {
  private let items = [
    "Tomatoes", "Basil", "Mozzarella", "Rice noodles", "Limes",
    "Chicken thighs", "Tortillas", "Miso paste", "Saffron", "Star anise"
  ]
  
  var body: some View {
    Section("Shopping List") {
      ForEach(items, id: \.self) { item in
        Label(item, systemImage: "circle")
      }
    }
  }
}

#Preview {
  PlannerView()
}
