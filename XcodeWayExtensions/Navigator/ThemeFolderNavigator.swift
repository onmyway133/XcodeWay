import Foundation
import AppKit

class ThemeFolderNavigator: Navigator {

  var title: String {
    return "Go To Themes Folder"
  }

  func navigate() {
    ScriptRunner().run(functionName: "myOpenThemesFolder")
  }
}
