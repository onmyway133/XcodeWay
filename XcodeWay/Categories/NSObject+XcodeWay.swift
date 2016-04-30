//
//  NSObject+XcodeWay.swift
//  XcodeWay
//
//  Created by Khoa Pham on 30/04/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Cocoa

extension NSObject {

  struct Static {
    static var onceToken: dispatch_once_t = 0
  }

  class func pluginDidLoad(bundle: NSBundle) {
    if let currentApplicationName = NSBundle.mainBundle().infoDictionary?["CFBundleName"] as? String
      where currentApplicationName == "Xcode" {

      dispatch_once(&Static.onceToken) {
        sharedPlugin = XcodeWay(bundle: bundle)
      }
    }
  }
}
