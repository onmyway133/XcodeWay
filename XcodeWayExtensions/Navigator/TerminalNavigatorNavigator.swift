import Foundation
import AppKit

class TerminalNavigator: Navigator {
    
  let defaults = UserDefaults(suiteName: "T78DK947F2.group.com.onmyway133.XcodeWay")

  var title: String {
    return "Go To Terminal"
  }

  func navigate() {
    let terminal = defaults?.string(forKey: "whichTerminal") ?? "Terminal"
    
    switch terminal {
    case "iTerm":
        ScriptRunner().run(functionName: "myOpeniTermForCurrentProject")
    default:
        ScriptRunner().run(functionName: "myOpenTerminalForCurrentProject")
    }
  }
}
