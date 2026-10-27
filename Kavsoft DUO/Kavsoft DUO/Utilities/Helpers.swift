//
// Helpers.swift
// Kavsoft DUO
//
// Created by MANAS VIJAYWARGIYA on 26/10/26.
// ------------------------------------------------------------------------
// Copyright © 2026 BLACENOVA. All rights reserved.
// ------------------------------------------------------------------------
//
    

import SwiftUI

func isIOS26OrLater() -> Bool {
  if #available(iOS 26, *) { return true }
  return false
}

func isIOS18OrLater() -> Bool {
  if #available(iOS 18, *) { return true }
  return false
}

func isIOS271OrLater() -> Bool {
  if #available(iOS 27.1, *) { return true }
  return false
}

func isIPhoneDuo() -> Bool {
  return UIDevice.modelName.contains("iPhone19,4")
}

enum ToolbarVerticalBehaviorOption {
  case automatic
  case disabled
}

struct ToolbarVerticalBehaviourModifier: ViewModifier {
  let behavior: ToolbarVerticalBehaviorOption
  
  func body(content: Content) -> some View {
    if #available(iOS 27.1, *) {
      switch behavior {
        case .automatic: content.toolbarVerticalBehavior(.automatic)
        case .disabled: content.toolbarVerticalBehavior(.disabled)
      }
    } else {
      content
    }
  }
}

extension View {
  func toolbarVerticalBehaviorCompat(_ behavior: ToolbarVerticalBehaviorOption) -> some View {
    modifier(ToolbarVerticalBehaviourModifier(behavior: behavior))
  }
}

func keyWindow() -> UIWindow? {
  (UIApplication.shared.connectedScenes.first { $0.activationState == .foregroundActive } as? UIWindowScene)?.windows.first { $0.isKeyWindow }
}

func keyWindowSize() -> CGSize {
  keyWindow()?.bounds.size ?? UIScreen.main.bounds.size
}

// Example
// keyWindowSize().height
// .frame(height: isIPhoneDuo() && keyWindowSize().width == 669 ? 50 : 0)
