//
//  SourceEditorCommand.swift
//  XcodeWay
//
//  Created by Khoa Pham on 22/07/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation
import XcodeKit

class SourceEditorCommand: NSObject, XCSourceEditorCommand {

  func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: (NSError?) -> Void ) -> Void {
    // Implement your command here, invoking the completion handler when done. Pass it nil on success, and an NSError on failure.

    completionHandler(nil)
  }

}
