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


func isIPhoneDuo() -> Bool {
  return UIDevice.modelName.contains("iPhone19,4")
}
