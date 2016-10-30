XcodeWay
==
Navigate to many places from Xcode

![](Screenshots/Banner.png)

Features
==

- Available as Xcode Source Editor Extension
- Via `Editor -> XcodeWay`

![](Screenshots/XcodeWay.png)

- [ ] Go To Project Folder
- [ ] Go To Project Derived Data Folder
- [x] Go To iOS 7 Simulator Folder
- [x] Go To iOS 8+ Simulator Folder
- [x] Go To Plugins Folder
- [x] Go To Templates Folder
- [x] Go To Archives Folder
- [x] Go To iOS Device Logs Folder
- [ ] Go To Derived Data Folder
- [x] Go To Provisioning Profile Folder
- [x] Go To User Data Folder
  - Go To Themes Folder
  - Go to xcdebugger Folder
- [ ] Go To Current Xcode Folder
- [x] Go To Selected Xcode Folder
- [ ] Go To iTerm with current project opened
- [ ] Go To Terminal with current project opened
- [ ] Go To Git Repositories
- [ ] List top files with most lines
- [ ] List top assets with largest sizes
- [ ] Show FIXME, TODO warnings
- [ ] List dynamic libraries sizes
- [ ] Reload Xcode bundles
- [x] Show Xcode `DVTPlugInCompatibilityUUID`

### Extensible

Add your own Navigator by conforming to `Navigator`

```swift
@objc protocol Navigator: NSObjectProtocol {
  func navigate()
  var title: String { get }
}
```

## Installation

- How to install https://medium.com/@onmyway133/install-xcode-8-source-editor-extension-10c9849e33b0
- Run `sudo /usr/libexec/xpccachectl` and restart Mac
- Run the project

## Troubleshooting

- Stop `com.apple.dt.Xcode.AttachToXPCService`
- It only works when a Swift file is selected
- If the menu is disappeared or disabled, run again

Licence
--
This project is released under the MIT license. See LICENSE.md.
