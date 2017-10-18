use scripting additions
use framework "Foundation"
property NSString : a reference to current application's NSString

-- Helper

on myRemoveLastPath(myPath)
set myString to NSString's stringWithString:myPath
set removedLastPathString to myString's stringByDeletingLastPathComponent
removedLastPathString as text
end myRemoveLastPath

on myFolderExists(myFolder) -- (String) as Boolean
tell application "System Events"
if exists folder myFolder then
return true
else
return false
end if
end tell
end myFolderExists

-- Path

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

on myProjectPath()
tell application "Xcode"
tell active workspace document
set myPath to path
end tell
end tell
myRemoveLastPath(myPath)
end myProjectPath

-- Generic Open

on myOpenFolder(myPath)
tell application "Finder"
activate
open myPath as POSIX file
end tell
end myOpenFolder

on myOpeniTerm(myPath)
tell application "Finder"
do shell script "open -a iTerm " & quoted form of myPath
end tell
end myOpeniTerm

-- Open

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

on myOpenProjectFolder()
set myPath to myProjectPath()
myOpenFolder(myPath)
end myOpenProjectFolder

on myOpeniTermForCurrentProject()
set myPath to myProjectPath()
myOpeniTerm(myPath)
end myOpeniTermForCurrentProject

on myOpenDerivedDataFolder()
set myRelativePath to myProjectPath() & "/DerivedData/"
if myFolderExists(myRelativePath) then
myOpenFolder(myRelativePath)
else
myOpenFolder(myXcodePath() & "/DerivedData/")
end if
end myOpenDerivedDataFolder

myOpenDerivedDataFolder()
