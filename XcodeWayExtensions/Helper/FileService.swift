import Foundation

final class FileService {
  static var homePath: URL {
    let components = FileManager.default.homeDirectoryForCurrentUser.pathComponents

    var paths = [String]()
    Array(1...2).forEach {
      paths.append(components[$0])
    }

    let path = paths.joined(separator: "/")
    return URL(fileURLWithPath: "/\(path)")
  }

  // In macOS, it is the application’s sandbox directory
  // or the current user’s home directory (if the application is not in a sandbox)
  static var applicationSandboxPath: URL {
    return FileManager.default.homeDirectoryForCurrentUser
  }

  static var libraryPath: URL {
    return homePath.appendingPathComponent("Library")
  }

  static var xcodePath: URL {
    return libraryPath.appendingPathComponent("Developer/Xcode")
  }

  static var userDataPath: URL {
    return xcodePath.appendingPathComponent("UserData")
  }
}
