import Foundation
import AppKit

class DocumentNavigator: Navigator {

  var title: String {
    return "Go To Document"
  }

  func navigate() {
    ScriptRunner().run(functionName: "myOpenDocument")
  }
}
