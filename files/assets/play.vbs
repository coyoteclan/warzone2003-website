Option Explicit

Dim fso, shell, scriptPath, scriptFolder, gameDir, exePath
Set fso = CreateObject("Scripting.FileSystemObject")
Set shell = CreateObject("WScript.Shell")

scriptPath = WScript.ScriptFullName
scriptFolder = fso.GetParentFolderName(scriptPath)
gameDir = fso.BuildPath(scriptFolder, "game_data")
exePath = fso.BuildPath(gameDir, "iw1x-r.exe")

If Not fso.FolderExists(gameDir) Then
  MsgBox "Required folder was not found:" & vbCrLf & gameDir, vbExclamation + vbOKOnly, "Folder missing"
  WScript.Quit 1
End If

If Not fso.FileExists(exePath) Then
  MsgBox "Executable not found:" & vbCrLf & exePath, vbExclamation + vbOKOnly, "File missing"
  WScript.Quit 1
End If

shell.CurrentDirectory = gameDir
Dim cmd
cmd = """" & exePath & """" & " +set r_ignorehwgamma 1 +set cl_allowDownload 1 +set com_introplayed 1 +set ui_netSource 2 +set cl_motd 0"
shell.Run cmd, 1, False

