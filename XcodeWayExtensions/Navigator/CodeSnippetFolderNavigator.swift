import Foundation
import AppKit

class CodeSnippetFolderNavigator: Navigator {

  var title: String {
    return "Go To CodeSnippets Folder"
  }

  func navigate() {
    ScriptRunner().run(functionName: "myOpenCodeSnippetsFolder")
  }
}
