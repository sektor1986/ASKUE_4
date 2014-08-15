; Script generated by the ������ Inno Setup Script.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{0F91693E-DC04-41D1-B342-7351AA8F3100}
AppName=ASKUE VZEP
AppVerName=ASKUE VZEP 4
AppPublisher=VZEP
DefaultDirName={pf}\ASKUE VZEP 4
DefaultGroupName=ASKUE VZEP 4
AllowNoIcons=yes
OutputDir=e:\sektor\GIT_project\ASCUE_4\Instal_pack\
OutputBaseFilename=ASKUE VZEP 4.0.0.49

SetupIconFile=e:\sektor\GIT_project\ASCUE_4\Release\vzep.ico
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "e:\sektor\GIT_project\ASCUE_4\Release\ASKUE_VZEP.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "e:\sektor\GIT_project\ASCUE_4\Release\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\ASKUE VZEP"; Filename: "{app}\ASKUE_VZEP.exe"
Name: "{group}\{cm:UninstallProgram,ASKUE VZEP}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\ASKUE VZEP"; Filename: "{app}\ASKUE_VZEP.exe"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\ASKUE VZEP"; Filename: "{app}\ASKUE_VZEP.exe"; Tasks: quicklaunchicon

[Run]
Filename: "{app}\ASKUE_VZEP.exe"; Description: "{cm:LaunchProgram,ASKUE VZEP}"; Flags: nowait postinstall skipifsilent






































