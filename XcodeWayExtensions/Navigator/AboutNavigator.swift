import Foundation
import AppKit

class AboutNavigator: Navigator {

  var title: String {
    return "About"
  }

  func navigate() {
    ScriptRunner().run(functionName: "myOpenAbout")
  }
}
