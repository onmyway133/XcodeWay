//
//  Alert+Extensions.swift
//  XcodeWay
//
//  Created by Khoa Pham on 22/07/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Cocoa

public extension NSAlert {

  static func show(message: String) {
    let alert = NSAlert()
    alert.messageText = "XcodeWay"
    alert.informativeText = message
    alert.addButton(withTitle: "OK")

    alert.runModal()
  }
}
