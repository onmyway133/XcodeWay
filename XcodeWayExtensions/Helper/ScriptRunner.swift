//
//  ScriptRunner.swift
//  XcodeWayExtensions
//
//  Created by Khoa Pham on 18.10.2017.
//  Copyright © 2017 Fantageek. All rights reserved.
//

import AppKit

class ScriptRunner {
  var scriptPath: URL? {
    return try? FileManager.default.url(
      for: .applicationScriptsDirectory,
      in: .userDomainMask,
      appropriateFor: nil,
      create: true
    )
  }

  func fileScriptPath(fileName: String) -> URL? {
    return scriptPath?
      .appendingPathComponent(fileName)
      .appendingPathExtension("scpt")
  }

  func run(fileName: String) {
    guard let filePath = fileScriptPath(fileName: fileName) else {
      return
    }

    guard FileManager.default.fileExists(atPath: filePath.path) else {
      return
    }

    guard let script = try? NSUserAppleScriptTask(url: filePath) else {
      return
    }

    script.execute(completionHandler: nil)
  }
}
