import Foundation

final class FileService {
  static var homePath: URL {
    return FileManager.default.homeDirectoryForCurrentUser
  }

  static var libraryPath: URL {
    return homePath.appendingPathComponent("Library")
  }

  static var xcodePath: URL {
    return libraryPath.appendingPathComponent("Developer/Xcode")
  }

  static var userDataPath: URL {
    return xcodePath.appendingPathExtension("UserData")
  }
}
