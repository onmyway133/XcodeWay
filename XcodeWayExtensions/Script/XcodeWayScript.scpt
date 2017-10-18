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
end myOpenThemesFolder

