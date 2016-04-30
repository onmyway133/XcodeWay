//
//  PluginType.swift
//  XcodeWay
//
//  Created by Khoa Pham on 30/04/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

protocol PluginType {
  static func pluginDidLoad(bundle: NSBundle)
  init(bundle: NSBundle)
}
