import Foundation
import AppKit

class iTermNavigator: Navigator {

  var title: String {
    return "Go To iTerm"
  }

  func navigate() {
    ScriptRunner().run(functionName: "myOpeniTermForCurrentProject")
  }
}
