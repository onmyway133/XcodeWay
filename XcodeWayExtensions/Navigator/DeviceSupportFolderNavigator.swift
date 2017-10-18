import Foundation
import AppKit

class DeviceSupportFolderNavigator: Navigator {

  var title: String {
    return "Go To DeviceSupport Folder"
  }

  func navigate() {
    ScriptRunner().run(functionName: "myOpenDeviceSupportFolder")
  }
}
