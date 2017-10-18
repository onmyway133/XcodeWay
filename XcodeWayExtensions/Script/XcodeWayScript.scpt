on myHomePath()
tell application "System Events"
"/Users/" & (name of current user)
end tell
end myHomePath

on myLibraryPath()
myHomePath() & "/Library"
end myLibraryPath

on myXcodePath()
myLibraryPath() & "/Developer/Xcode"
end myXcodePath

on myUserDataPath()
myXcodePath() & "/UserData"
end myUserDataPath

on myOpenFolder(myPath)
tell application "Finder"
activate
open myPath as POSIX file
end tell
end myOpenFolder

on myOpenThemesFolder()
set myPath to myUserDataPath() & "/FontAndColorThemes/"
myOpenFolder(myPath)
end myOpenThemesFolder

on myOpenCodeSnippetsFolder()
set myPath to myUserDataPath() & "/CodeSnippets/"
myOpenFolder(myPath)
end myOpenCodeSnippetsFolder

on myOpenDeviceSupportFolder()
set myPath to "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport"
myOpenFolder(myPath)
end myOpenDeviceSupportFolder

on myOpenArchivesFolder()
set myPath to myXcodePath() & "/Archives/"
myOpenFolder(myPath)
end myOpenArchivesFolder

on myOpenProvisioningProfileFolder()
set myPath to myLibraryPath() & "/MobileDevice/Provisioning Profiles"
myOpenFolder(myPath)
end myOpenProvisioningProfileFolder

