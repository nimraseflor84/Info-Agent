use framework "AppKit"
use scripting additions

set iconPath to (POSIX path of (path to home folder)) & "Desktop/DEV/autodoc-info-agent/icon.png"
set filePath to (POSIX path of (path to home folder)) & "Desktop/DEV/autodoc-info-agent/AUTODOC INFO AGENT.command"

set img to current application's NSImage's alloc()'s initWithContentsOfFile:iconPath
current application's NSWorkspace's sharedWorkspace()'s setIcon:img forFile:filePath options:0

display dialog "Icon erfolgreich gesetzt!" buttons {"OK"} default button "OK"
