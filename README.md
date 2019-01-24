XcodeWay
==

❤️ Support my work https://gum.co/eXiul ❤️

![](Screenshots/Banner.png)

## Description

- An Xcode Source Editor Extension that helps navigating to many places easier
- Available via `Editor -> XcodeWay`

![](https://user-images.githubusercontent.com/2284279/47280109-101ebb80-d5d5-11e8-854f-b2fb19452769.png)
![](Screenshots/demo.gif)

## Features

- [x] Go To Project Folder: Open the selected Xcode project folder in Finder
- [x] Go To iTerm: Open the selected Xcode project folder in iTerm
- [x] Go To DerivedData Folder: Check and open relative DerivedData if any, otherwise open global DerivedData
- [x] Open GitHub: Check and open `git remote` in your default browser
- [x] Open Current File in Github: Open the current file in GitHub
- [x] Go To Provisioning Profiles Folder: Open in Finder
- [x] Go To Themes Folder: Open in Finder
- [x] Go To Archives Folder: Open in Finder
- [x] Go To DeviceSupport Folder: Open in Finder
- [x] Go To CodeSnippets Folder: Open in Finder
- [x] Go To Document Folder: Go to current app Document folder for current simulator

## Extensible

Although all common scenarios are covered, there's some more that you want to navigate to. Then just add your own by conforming to `Navigator`. Pull requests are welcome.

```swift
protocol Navigator {
  func navigate()
  var title: String { get }
}
```

## How to install

- Download the latest binary from https://github.com/onmyway133/XcodeWay/releases
- How to install https://medium.com/@onmyway133/install-xcode-8-source-editor-extension-10c9849e33b0
- **Install scripts**: To fully use `XcodeWay`, you need to allow scripting, run this

```sh
curl -fsSL https://raw.githubusercontent.com/onmyway133/XcodeWay/master/install.sh | sh
```

#### Troubleshooting

- Stop `com.apple.dt.Xcode.AttachToXPCService`
- Run `sudo /usr/libexec/xpccachectl` and restart Mac
- It only works when a Swift file is selected
- If the menu is disappeared or disabled, run again

## Credit

- Icon https://www.emojione.com/

## Licence

This project is released under the MIT license. See LICENSE.md.
