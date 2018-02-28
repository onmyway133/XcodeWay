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

on myRemoveSubString(oldString, subString)
set myString to NSString's stringWithString:oldString
set newString to myString's stringByReplacingOccurrencesOfString:subString withString:""
newString as text
end myRemoveSubString

on myGetRemote(myText)
set myString to NSString's stringWithString:myText
set myParts to myString's componentsSeparatedByString:"\t"
set myFirstParts to item 1 of myParts
myFirstParts as text
end myGetRemote

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

on myCurrentFilePath()
tell application "Xcode"
set activeDocument to document 1 whose name ends with (word -1 of (get name of window 1))
path of activeDocument
end tell
end myCurrentFilePath

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

on myGitHubURL()
set myPath to myProjectPath()
set myConsoleOutput to (do shell script "cd " & quoted form of myPath & "; git remote -v")
set myRemote to myGetRemote(myConsoleOutput)
set myUrl to (do shell script "cd " & quoted form of myPath & "; git config --get remote." & quoted form of myRemote & ".url")
set myUrlWithOutDotGit to myRemoveSubString(myUrl, ".git")
end myGitHubURL

on myOpenGitHub()
set myUrl to myGitHubUrlOnMaster()
open location myUrl
end myOpenGitHub

on myGitHubUrlOnMaster()
set gitHubPath to myGitHubURL()
set myUrl to gitHubPath & "/blob/master"
end myGitHubUrlOnMaster

on myOpenFileInGitHub()
set currentFilePath to myCurrentFilePath()
set projectPath to myProjectPath()
set gitHubPath to myGitHubUrlOnMaster()
set relativePath to myRemoveSubString(currentFilePath, projectPath)
set fullUrl to gitHubPath & relativePath
open location fullUrl
end myOpenFileInGitHub

on myOpenDocument()
set command1 to "cd ~/Library/Developer/CoreSimulator/Devices/;"
set command2 to "cd `ls -t | head -n 1`/data/Containers/Data/Application;"
set command3 to "cd `ls -t | head -n 1`/Documents;"
set command4 to "open ."
do shell script command1 & command2 & command3 & command4
end myOpenDocument

on myOpenAbout()
open location "https://github.com/onmyway133/XcodeWay"
end myOpenAbout
