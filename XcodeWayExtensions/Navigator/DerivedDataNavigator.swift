import Foundation
import AppKit

class DerivedDataFolderNavigator: Navigator {

  var title: String {
    return "Go To DerivedData Folder"
  }

  func navigate() {
    ScriptRunner().run(functionName: "myOpenDerivedDataFolder")
  }
}


