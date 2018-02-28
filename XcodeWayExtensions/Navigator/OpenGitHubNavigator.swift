import Foundation
import AppKit

class GitHubNavigator: Navigator {

  var title: String {
    return "Open GitHub"
  }

  func navigate() {
    ScriptRunner().run(functionName: "myOpenGitHub")
  }
}
