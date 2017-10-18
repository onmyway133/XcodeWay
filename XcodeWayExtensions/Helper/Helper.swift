//
//  Helper.swift
//  XcodeWay
//
//  Created by Khoa Pham on 22/07/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

struct Helper {

  static func namespacedIdentifier(identifier: String) -> String {
    let bundleID = Bundle.main.bundleIdentifier ?? ""
    return "\(bundleID).\(identifier)"
      .replacingOccurrences(of: "+", with: "plus")
      .replacingOccurrences(of: " ", with: "-")
  }
}
