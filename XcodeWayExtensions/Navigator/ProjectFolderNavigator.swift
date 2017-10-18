import Foundation
import AppKit

class ProjectFolderNavigator: Navigator {

  var title: String {
    return "Go To Project Folder"
  }

  func navigate() {
    ScriptRunner().run(functionName: "myOpenProjectFolder")
  }
}
