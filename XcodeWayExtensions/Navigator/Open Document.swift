import Foundation
import AppKit

class OpenDocumentNavigator: Navigator {

  var title: String {
    return "Open Document"
  }

  func navigate() {
    ScriptRunner().run(functionName: "myOpenDocument")
  }
}
