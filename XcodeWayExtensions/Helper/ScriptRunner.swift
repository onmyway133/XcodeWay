//
//  ScriptRunner.swift
//  XcodeWayExtensions
//
//  Created by Khoa Pham on 18.10.2017.
//  Copyright © 2017 Fantageek. All rights reserved.
//

import AppKit
import Carbon

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

  func eventDescriptior(functionName: String) -> NSAppleEventDescriptor {
    var psn = ProcessSerialNumber(highLongOfPSN: 0, lowLongOfPSN: UInt32(kCurrentProcess))
    let target = NSAppleEventDescriptor(
      descriptorType: typeProcessSerialNumber,
      bytes: &psn,
      length: MemoryLayout<ProcessSerialNumber>.size
    )

    let event = NSAppleEventDescriptor(
      eventClass: UInt32(kASAppleScriptSuite),
      eventID: UInt32(kASSubroutineEvent),
      targetDescriptor: target,
      returnID: Int16(kAutoGenerateReturnID),
      transactionID: Int32(kAnyTransactionID)
    )

    let function = NSAppleEventDescriptor(string: functionName)
    event.setParam(function, forKeyword: AEKeyword(keyASSubroutineName))

    return event
  }

  func run(functionName: String) {
    guard let filePath = fileScriptPath(fileName: "XcodeWayScript") else {
      return
    }

    guard FileManager.default.fileExists(atPath: filePath.path) else {
      return
    }

    guard let script = try? NSUserAppleScriptTask(url: filePath) else {
      return
    }

    let event = eventDescriptior(functionName: functionName)
    script.execute(withAppleEvent: event, completionHandler: { _, error in
      if let error = error {
        print(error)
      }
    })
  }
}
