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
    return (Bundle.main.bundleIdentifier ?? "") + identifier
  }
}
