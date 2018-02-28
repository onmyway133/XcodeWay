import Foundation
import AppKit

class OpenFileInGitHubNavigator: Navigator {

  var title: String {
    return "Open File in GitHub"
  }

  func navigate() {
    ScriptRunner().run(functionName: "myOpenFileInGitHub")
  }
}
