import Foundation
import AppKit

class ProvisioningProfileFolderNavigator: Navigator {

  var title: String {
    return "Go To Provisioning Profiles Folder"
  }

  func navigate() {
    ScriptRunner().run(functionName: "myOpenProvisioningProfileFolder")
  }
}
