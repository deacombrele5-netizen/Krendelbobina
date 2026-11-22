; =============================================================================
; SOFT - установщик программной коллекции
;
; Назначение: выборочная установка программ и подготовка выбранных архивов из MySoft.
;
; ПЕРЕД СБОРКОЙ:
; 1. Проверьте, что исходная папка находится по пути MySoftRoot ниже.
; 2. В корне MySoftRoot должны находиться app.ico и папка "Софт (исходники)".
; 3. Структура каталогов должна соответствовать MySoft_Structure_UTF8.txt.
; 4. Откройте этот файл в Inno Setup Compiler и нажмите Compile.
;
; ВАЖНО: app.ico используется только как значок самого Setup.exe.
; Файл app.ico не добавлен в [Files] и не устанавливается на компьютер пользователя.
; Все содержимое выбранных папок включается в установку без Excludes и без выборочного
; удаления файлов; вложенные каталоги и пустые папки сохраняются.
;
; Интерфейс: стандартные страницы мастера Inno Setup с тёмным оформлением.
; Выбор папки и компонентов выполняется встроенными средствами Inno Setup.
; Категории каталога отображаются как вложенный список с системными флажками.
; =============================================================================

#define MyAppName "Софт"
#ifndef MySoftRoot
#define MySoftRoot "E:\для всего\MySoft"
#endif
#define SourceRoot MySoftRoot + "\Софт (исходники)"
#define PortableRoot SourceRoot + "\Софт-Portable\Программы без архива-Portable"
#define SetupRoot SourceRoot + "\Софт-SetUp\Программы без архива-SetUp"
#define PortableArchiveRoot SourceRoot + "\Софт-Portable"
#define SetupArchiveRoot SourceRoot + "\Софт-SetUp"
#define OutputRoot MySoftRoot + "\Софт\Софт - установка"
; Наличие исходных файлов проверяется самим Inno Setup при компиляции
; по путям, указанным в секции [Files]. Не используем проверки #if DirExists:
; они выполняются препроцессором и не подходят для проверки локальной структуры.

[Setup]
AppId={{8D9C3E1A-4E2B-9F11-1234567890AB}
AppName={#MyAppName}
AppVersion=Софт
AppVerName=Софт
AppPublisher=Софт
DefaultDirName=C:\
AppendDefaultDirName=no
AllowRootDirectory=yes
DirExistsWarning=no
AllowUNCPath=yes
UsePreviousAppDir=no
CreateAppDir=yes
DisableDirPage=no
DisableWelcomePage=yes
DisableProgramGroupPage=yes
DisableReadyMemo=no
Uninstallable=no
PrivilegesRequired=admin
OutputDir={#OutputRoot}
OutputBaseFilename=SoftSetup
Compression=lzma2/normal
SolidCompression=yes
DiskSpanning=yes
DiskSliceSize=35000000000
SlicesPerDisk=1
WizardStyle=modern dark
AlwaysShowComponentsList=yes
FlatComponentsList=no
WizardSizePercent=100
SetupIconFile={#MySoftRoot}\app.ico
DefaultDialogFontName=Segoe UI
CloseApplications=no

[Messages]
SetupWindowTitle=Установка - %1
WizardSelectDir=Выберите папку установки
SelectDirDesc=Укажите папку, в которой будут размещены выбранные программы или архивы.
SelectDirLabel3=
SelectDirBrowseLabel=Для выбора другой папки нажмите «Обзор».
WizardSelectComponents=Выбор программ
SelectComponentsDesc=Отметьте программы из каталога, которые нужно разместить в выбранной папке.
SelectComponentsLabel2=
WizardReady=Готово к установке
ReadyLabel1=Мастер установки готов перенести выбранные файлы на ваш компьютер.
ReadyLabel2a=
ReadyLabel2b=
WizardInstalling=Установка...
InstallingLabel=Выполняется размещение выбранных компонентов. Дождитесь завершения процесса.
FinishedHeadingLabel=Установка завершена
FinishedLabelNoIcons=Чтобы завершить установку, нажмите кнопку: «Завершить».
FinishedLabel=Чтобы завершить установку, нажмите кнопку: «Завершить».
ClickFinish=Нажмите «Завершить», чтобы закрыть мастер установки.

[Languages]
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"

[Types]
Name: "custom"; Description: "Выборочная установка"; Flags: iscustom

[Components]
Name: "setup"; Description: "Установщики программ"; Types: custom; Flags: fixed
Name: "setup\s_adobe_acrobat"; Description: "Adobe Acrobat Pro"; Types: custom; Flags: dontinheritcheck
Name: "setup\s_adobe_aftereffects"; Description: "Adobe After Effects"; Types: custom; Flags: dontinheritcheck
Name: "setup\s_adobe_animate"; Description: "Adobe Animate"; Types: custom; Flags: dontinheritcheck
Name: "setup\s_adobe_audition"; Description: "Adobe Audition"; Types: custom; Flags: dontinheritcheck
Name: "setup\s_adobe_lightroom"; Description: "Adobe Lightroom Classic"; Types: custom; Flags: dontinheritcheck
Name: "setup\s_adobe_substance"; Description: "Adobe Substance 3D Painter"; Types: custom; Flags: dontinheritcheck
Name: "setup\s_aida64"; Description: "AIDA 64"; Types: custom; Flags: dontinheritcheck
Name: "setup\s_blender"; Description: "Blender 3D"; Types: custom; Flags: dontinheritcheck
Name: "setup\s_discord"; Description: "Discord"; Types: custom; Flags: dontinheritcheck
Name: "setup\s_epic"; Description: "Epic Games"; Types: custom; Flags: dontinheritcheck
Name: "setup\s_flstudio"; Description: "FL Studio"; Types: custom; Flags: dontinheritcheck
Name: "setup\s_illustrator"; Description: "Adobe Illustrator"; Types: custom; Flags: dontinheritcheck
Name: "setup\s_indesign"; Description: "Adobe InDesign"; Types: custom; Flags: dontinheritcheck
Name: "setup\s_localsend"; Description: "LocalSend"; Types: custom; Flags: dontinheritcheck
Name: "setup\s_office"; Description: "Microsoft Office"; Types: custom; Flags: dontinheritcheck
Name: "setup\s_obs"; Description: "OBS Studio"; Types: custom; Flags: dontinheritcheck
Name: "setup\s_photoshop"; Description: "Adobe Photoshop"; Types: custom; Flags: dontinheritcheck
Name: "setup\s_premier"; Description: "Adobe Premiere Pro"; Types: custom; Flags: dontinheritcheck
Name: "setup\s_steam"; Description: "Steam"; Types: custom; Flags: dontinheritcheck
Name: "setup\s_torrent"; Description: "Torrent"; Types: custom; Flags: dontinheritcheck
Name: "setup\s_winrar"; Description: "WinRAR"; Types: custom; Flags: dontinheritcheck
Name: "setup\visualstudio"; Description: "Visual Studio"; Types: custom
Name: "setup\visualstudio\vs"; Description: "Visual Studio"; Types: custom
Name: "setup\visualstudio\vscode"; Description: "Visual Studio Code"; Types: custom
Name: "setup\browsers"; Description: "Браузеры"; Types: custom
Name: "setup\browsers\chrome"; Description: "Google Chrome"; Types: custom
Name: "setup\browsers\firefox"; Description: "Mozilla Firefox"; Types: custom
Name: "setup\browsers\edge"; Description: "Microsoft Edge"; Types: custom
Name: "setup\browsers\opera"; Description: "Opera"; Types: custom
Name: "setup\browsers\yandex"; Description: "Яндекс Браузер"; Types: custom
Name: "portable"; Description: "Портативные программы"; Types: custom; Flags: fixed
Name: "portable\p_adobe_acrobat"; Description: "Adobe Acrobat Pro"; Types: custom; Flags: dontinheritcheck
Name: "portable\p_adobe_aftereffects"; Description: "Adobe After Effects"; Types: custom; Flags: dontinheritcheck
Name: "portable\p_adobe_audition"; Description: "Adobe Audition"; Types: custom; Flags: dontinheritcheck
Name: "portable\p_adobe_illustrator"; Description: "Adobe Illustrator"; Types: custom; Flags: dontinheritcheck
Name: "portable\p_adobe_photoshop"; Description: "Adobe Photoshop"; Types: custom; Flags: dontinheritcheck
Name: "portable\p_adobe_premiere"; Description: "Adobe Premiere Pro"; Types: custom; Flags: dontinheritcheck
Name: "portable\p_aida64"; Description: "AIDA64"; Types: custom; Flags: dontinheritcheck
Name: "portable\p_anydesk"; Description: "AnyDesk"; Types: custom; Flags: dontinheritcheck
Name: "portable\p_blender"; Description: "Blender"; Types: custom; Flags: dontinheritcheck
Name: "portable\p_easy2boot"; Description: "Easy2Boot"; Types: custom; Flags: dontinheritcheck
Name: "portable\p_encryptonclick"; Description: "EncryptOnClick"; Types: custom; Flags: dontinheritcheck
Name: "portable\p_chrome"; Description: "Google Chrome"; Types: custom; Flags: dontinheritcheck
Name: "portable\p_imgburn"; Description: "ImgBurn"; Types: custom; Flags: dontinheritcheck
Name: "portable\p_localsend"; Description: "LocalSend"; Types: custom; Flags: dontinheritcheck
Name: "portable\p_scanner"; Description: "Microsoft Scanner"; Types: custom; Flags: dontinheritcheck
Name: "portable\p_nsis"; Description: "NSIS"; Types: custom; Flags: dontinheritcheck
Name: "portable\p_obs"; Description: "OBS Studio"; Types: custom; Flags: dontinheritcheck
Name: "portable\p_portablecreator"; Description: "Portable Creator"; Types: custom; Flags: dontinheritcheck
Name: "portable\p_putty"; Description: "PuTTY"; Types: custom; Flags: dontinheritcheck
Name: "portable\p_rufus"; Description: "Rufus"; Types: custom; Flags: dontinheritcheck
Name: "portable\p_sysinternals"; Description: "Sysinternals Suite"; Types: custom; Flags: dontinheritcheck
Name: "portable\p_utorrent"; Description: "µTorrent"; Types: custom; Flags: dontinheritcheck
Name: "portable\p_vlc"; Description: "VLC Media Player"; Types: custom; Flags: dontinheritcheck
Name: "portable\p_vscode"; Description: "Visual Studio Code"; Types: custom; Flags: dontinheritcheck
Name: "portable\p_wifiinfoview"; Description: "WifiInfoView"; Types: custom; Flags: dontinheritcheck
Name: "portable\p_winnote"; Description: "WinNotepad"; Types: custom; Flags: dontinheritcheck
Name: "portable\p_winpowershell"; Description: "WinPowerShell"; Types: custom; Flags: dontinheritcheck
Name: "portable\p_winrar"; Description: "WinRAR"; Types: custom; Flags: dontinheritcheck
Name: "portable\p_winscp"; Description: "WinSCP"; Types: custom; Flags: dontinheritcheck
Name: "portable\p_winsetup"; Description: "WinSetupFromUSB"; Types: custom; Flags: dontinheritcheck
Name: "portable\p_winterminal"; Description: "Windows Terminal"; Types: custom; Flags: dontinheritcheck
Name: "portable\p_wnetwatcher"; Description: "WNetWatcher"; Types: custom; Flags: dontinheritcheck
[Files]
Source: "{#PortableRoot}\AdobeAcrobatPro-Portable\*"; DestDir: "{code:GetTargetFolder|AdobeAcrobatPro-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: portable\p_adobe_acrobat
Source: "{#PortableRoot}\AdobeAfterEffects-Portable\*"; DestDir: "{code:GetTargetFolder|AdobeAfterEffects-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: portable\p_adobe_aftereffects
Source: "{#PortableRoot}\AdobeAudition-Portable\*"; DestDir: "{code:GetTargetFolder|AdobeAudition-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: portable\p_adobe_audition
Source: "{#PortableRoot}\AdobeIllustrator-Portable\*"; DestDir: "{code:GetTargetFolder|AdobeIllustrator-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: portable\p_adobe_illustrator
Source: "{#PortableRoot}\AdobePhotoshop-Portable\*"; DestDir: "{code:GetTargetFolder|AdobePhotoshop-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: portable\p_adobe_photoshop
Source: "{#PortableRoot}\AdobePremierePro-Portable\*"; DestDir: "{code:GetTargetFolder|AdobePremierePro-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: portable\p_adobe_premiere
Source: "{#PortableRoot}\AIDA64-Portable\*"; DestDir: "{code:GetTargetFolder|AIDA64-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: portable\p_aida64
Source: "{#PortableRoot}\AnyDesk-Portable\*"; DestDir: "{code:GetTargetFolder|AnyDesk-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: portable\p_anydesk
Source: "{#PortableRoot}\Blender-Portable\*"; DestDir: "{code:GetTargetFolder|Blender-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: portable\p_blender
Source: "{#PortableRoot}\Easy2Boot-Portable\*"; DestDir: "{code:GetTargetFolder|Easy2Boot-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: portable\p_easy2boot
Source: "{#PortableRoot}\EncryptOnClick-Portable\*"; DestDir: "{code:GetTargetFolder|EncryptOnClick-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: portable\p_encryptonclick
Source: "{#PortableRoot}\GoogleChrome-Portable\*"; DestDir: "{code:GetTargetFolder|GoogleChrome-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: portable\p_chrome
Source: "{#PortableRoot}\ImgBurn-Portable\*"; DestDir: "{code:GetTargetFolder|ImgBurn-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: portable\p_imgburn
Source: "{#PortableRoot}\LocalSend-Portable\*"; DestDir: "{code:GetTargetFolder|LocalSend-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: portable\p_localsend
Source: "{#PortableRoot}\MicrosoftScaner-Portable\*"; DestDir: "{code:GetTargetFolder|MicrosoftScaner-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: portable\p_scanner
Source: "{#PortableRoot}\NSIS-Portable\*"; DestDir: "{code:GetTargetFolder|NSIS-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: portable\p_nsis
Source: "{#PortableRoot}\OBS-Studio-Portable\*"; DestDir: "{code:GetTargetFolder|OBS-Studio-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: portable\p_obs
Source: "{#PortableRoot}\PortableCreator-Portable\*"; DestDir: "{code:GetTargetFolder|PortableCreator-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: portable\p_portablecreator
Source: "{#PortableRoot}\PuTTY-Portable\*"; DestDir: "{code:GetTargetFolder|PuTTY-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: portable\p_putty
Source: "{#PortableRoot}\Rufus-Portable\*"; DestDir: "{code:GetTargetFolder|Rufus-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: portable\p_rufus
Source: "{#PortableRoot}\SysinternalsSuite-Portable\*"; DestDir: "{code:GetTargetFolder|SysinternalsSuite-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: portable\p_sysinternals
Source: "{#PortableRoot}\uTorrent-Portable\*"; DestDir: "{code:GetTargetFolder|uTorrent-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: portable\p_utorrent
Source: "{#PortableRoot}\VlcMediaPlayer-Portable\*"; DestDir: "{code:GetTargetFolder|VlcMediaPlayer-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: portable\p_vlc
Source: "{#PortableRoot}\VSCode-Portable\*"; DestDir: "{code:GetTargetFolder|VSCode-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: portable\p_vscode
Source: "{#PortableRoot}\Wifiinfoview-Portable\*"; DestDir: "{code:GetTargetFolder|Wifiinfoview-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: portable\p_wifiinfoview
Source: "{#PortableRoot}\WinNotepad-Portable\*"; DestDir: "{code:GetTargetFolder|WinNotepad-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: portable\p_winnote
Source: "{#PortableRoot}\WinPowerShel-Portable\*"; DestDir: "{code:GetTargetFolder|WinPowerShel-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: portable\p_winpowershell
Source: "{#PortableRoot}\WinRAR-Portable\*"; DestDir: "{code:GetTargetFolder|WinRAR-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: portable\p_winrar
Source: "{#PortableRoot}\WinSCP-Portable\*"; DestDir: "{code:GetTargetFolder|WinSCP-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: portable\p_winscp
Source: "{#PortableRoot}\WinSetupFromUSB-Portable\*"; DestDir: "{code:GetTargetFolder|WinSetupFromUSB-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: portable\p_winsetup
Source: "{#PortableRoot}\WinTerminal-Portable\*"; DestDir: "{code:GetTargetFolder|WinTerminal-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: portable\p_winterminal
Source: "{#PortableRoot}\Wnet-Watcher-Portable\*"; DestDir: "{code:GetTargetFolder|Wnet-Watcher-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: portable\p_wnetwatcher
Source: "{#SetupRoot}\Adobe Acrobat Pro\*"; DestDir: "{code:GetTargetFolder|Adobe Acrobat Pro}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: setup\s_adobe_acrobat
Source: "{#SetupRoot}\Adobe After Effects\*"; DestDir: "{code:GetTargetFolder|Adobe After Effects}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: setup\s_adobe_aftereffects
Source: "{#SetupRoot}\Adobe Animate\*"; DestDir: "{code:GetTargetFolder|Adobe Animate}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: setup\s_adobe_animate
Source: "{#SetupRoot}\Adobe Audition\*"; DestDir: "{code:GetTargetFolder|Adobe Audition}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: setup\s_adobe_audition
Source: "{#SetupRoot}\Adobe Lightroom Classic\*"; DestDir: "{code:GetTargetFolder|Adobe Lightroom Classic}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: setup\s_adobe_lightroom
Source: "{#SetupRoot}\Adobe Substance 3D Painter\*"; DestDir: "{code:GetTargetFolder|Adobe Substance 3D Painter}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: setup\s_adobe_substance
Source: "{#SetupRoot}\AIDA 64\*"; DestDir: "{code:GetTargetFolder|AIDA 64}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: setup\s_aida64
Source: "{#SetupRoot}\Blender 3D\*"; DestDir: "{code:GetTargetFolder|Blender 3D}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: setup\s_blender
Source: "{#SetupRoot}\Discord\*"; DestDir: "{code:GetTargetFolder|Discord}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: setup\s_discord
Source: "{#SetupRoot}\Epic Games\*"; DestDir: "{code:GetTargetFolder|Epic Games}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: setup\s_epic
Source: "{#SetupRoot}\FL Studio\*"; DestDir: "{code:GetTargetFolder|FL Studio}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: setup\s_flstudio
Source: "{#SetupRoot}\Illustrator\*"; DestDir: "{code:GetTargetFolder|Illustrator}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: setup\s_illustrator
Source: "{#SetupRoot}\InDesign\*"; DestDir: "{code:GetTargetFolder|InDesign}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: setup\s_indesign
Source: "{#SetupRoot}\LocalSend\*"; DestDir: "{code:GetTargetFolder|LocalSend}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: setup\s_localsend
Source: "{#SetupRoot}\Microsoft Office\*"; DestDir: "{code:GetTargetFolder|Microsoft Office}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: setup\s_office
Source: "{#SetupRoot}\OBS Studio\*"; DestDir: "{code:GetTargetFolder|OBS Studio}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: setup\s_obs
Source: "{#SetupRoot}\Photoshop\*"; DestDir: "{code:GetTargetFolder|Photoshop}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: setup\s_photoshop
Source: "{#SetupRoot}\Premier\*"; DestDir: "{code:GetTargetFolder|Premier}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: setup\s_premier
Source: "{#SetupRoot}\Steam\*"; DestDir: "{code:GetTargetFolder|Steam}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: setup\s_steam
Source: "{#SetupRoot}\Torrent\*"; DestDir: "{code:GetTargetFolder|Torrent}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: setup\s_torrent
Source: "{#SetupRoot}\WinRar\*"; DestDir: "{code:GetTargetFolder|WinRar}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: setup\s_winrar
Source: "{#SetupRoot}\Visual Studio (and Code version)\VS\*"; DestDir: "{code:GetTargetFolder|Visual Studio (and Code version)\VS}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: setup\visualstudio\vs
Source: "{#SetupRoot}\Visual Studio (and Code version)\VS Code\*"; DestDir: "{code:GetTargetFolder|Visual Studio (and Code version)\VS Code}"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: setup\visualstudio\vscode
Source: "{#SetupRoot}\Браузеры\ChromeSetup.exe"; DestDir: "{code:GetTargetFolder|Браузеры}"; Flags: ignoreversion; Components: setup\browsers\chrome
Source: "{#SetupRoot}\Браузеры\Firefox Installer.exe"; DestDir: "{code:GetTargetFolder|Браузеры}"; Flags: ignoreversion; Components: setup\browsers\firefox
Source: "{#SetupRoot}\Браузеры\MicrosoftEdgeSetup.exe"; DestDir: "{code:GetTargetFolder|Браузеры}"; Flags: ignoreversion; Components: setup\browsers\edge
Source: "{#SetupRoot}\Браузеры\OperaSetup.exe"; DestDir: "{code:GetTargetFolder|Браузеры}"; Flags: ignoreversion; Components: setup\browsers\opera
Source: "{#SetupRoot}\Браузеры\Yandex.exe"; DestDir: "{code:GetTargetFolder|Браузеры}"; Flags: ignoreversion; Components: setup\browsers\yandex
Source: "{#PortableArchiveRoot}\Софт-Portable.rar"; DestDir: "{code:GetDestinationPath}"; Flags: ignoreversion; Check: IsItemSelected('a_portable')
Source: "{#PortableArchiveRoot}\Информация об архиве - Софт-Portable.txt"; DestDir: "{code:GetDestinationPath}"; Flags: ignoreversion; Check: IsItemSelected('a_portable')
Source: "{#SetupArchiveRoot}\Софт-SetUp.rar"; DestDir: "{code:GetDestinationPath}"; Flags: ignoreversion; Check: IsItemSelected('a_setup')
Source: "{#SetupArchiveRoot}\Информация об архиве - Софт-SetUp.txt"; DestDir: "{code:GetDestinationPath}"; Flags: ignoreversion; Check: IsItemSelected('a_setup')

[Code]

var
  InstallModePage: TInputOptionWizardPage;
  ArchivePage: TInputOptionWizardPage;

procedure InitializeWizard;
var
  I: Integer;
begin
  InstallModePage := CreateInputOptionPage(wpSelectDir,
    'Выбор способа установки',
    'Выберите, что установить: программы из каталога или готовые архивы.',
    'Выберите один из двух вариантов:',
    True, False);
  InstallModePage.Add('Выбор из каталога');
  InstallModePage.Add('Выбор архива');
  InstallModePage.SelectedValueIndex := 0;

  ArchivePage := CreateInputOptionPage(wpSelectComponents,
    'Выбор архивов',
    'Выберите архивы для установки.',
    '',
    False, False);
  ArchivePage.Add('Архив с портативными программами');
  ArchivePage.Add('Архив с установочными версиями программ');

  { Изначально снять отметки со всех отдельных программ каталога }
  WizardSelectComponents('!portable\p_adobe_acrobat,!portable\p_adobe_aftereffects,!portable\p_adobe_audition,!portable\p_adobe_illustrator,!portable\p_adobe_photoshop,!portable\p_adobe_premiere,!portable\p_aida64,!portable\p_anydesk,!portable\p_blender,!portable\p_easy2boot,!portable\p_encryptonclick,!portable\p_chrome,!portable\p_imgburn,!portable\p_localsend,!portable\p_scanner,!portable\p_nsis,!portable\p_obs,!portable\p_portablecreator,!portable\p_putty,!portable\p_rufus,!portable\p_sysinternals,!portable\p_utorrent,!portable\p_vlc,!portable\p_vscode,!portable\p_wifiinfoview,!portable\p_winnote,!portable\p_winpowershell,!portable\p_winrar,!portable\p_winscp,!portable\p_winsetup,!portable\p_winterminal,!portable\p_wnetwatcher,!setup\s_adobe_acrobat,!setup\s_adobe_aftereffects,!setup\s_adobe_animate,!setup\s_adobe_audition,!setup\s_adobe_lightroom,!setup\s_adobe_substance,!setup\s_aida64,!setup\s_blender,!setup\s_discord,!setup\s_epic,!setup\s_flstudio,!setup\s_illustrator,!setup\s_indesign,!setup\s_localsend,!setup\s_office,!setup\s_obs,!setup\s_photoshop,!setup\s_premier,!setup\s_steam,!setup\s_torrent,!setup\s_winrar,!setup\visualstudio\vs,!setup\visualstudio\vscode,!setup\browsers\chrome,!setup\browsers\firefox,!setup\browsers\edge,!setup\browsers\opera,!setup\browsers\yandex');

  { Свернуть категории браузеров и Visual Studio при открытии списка }
  for I := 0 to WizardForm.ComponentsList.ItemCount - 1 do
  begin
    if ((WizardForm.ComponentsList.ItemCaption[I] = 'Браузеры') or
      (WizardForm.ComponentsList.ItemCaption[I] = 'Visual Studio')) and
      (WizardForm.ComponentsList.ItemLevel[I] = 1) then
      WizardForm.ComponentsList.ItemExpanded[I] := False;
  end;
end;

function ShouldSkipPage(PageID: Integer): Boolean;
begin
  if PageID = wpSelectComponents then
    Result := InstallModePage.SelectedValueIndex <> 0
  else if PageID = ArchivePage.ID then
    Result := InstallModePage.SelectedValueIndex <> 1
  else
    Result := False;
end;

function GetDestinationPath(Param: String): String;
begin
  Result := WizardDirValue;
end;

function GetTargetFolder(Param: String): String;
begin
  Result := AddBackslash(WizardDirValue) + Param;
end;

function IsItemSelected(const ItemID: String): Boolean;
begin
  if ItemID = 'p_adobe_acrobat' then
    Result := WizardIsComponentSelected('portable\p_adobe_acrobat')
  else if ItemID = 'p_adobe_aftereffects' then
    Result := WizardIsComponentSelected('portable\p_adobe_aftereffects')
  else if ItemID = 'p_adobe_audition' then
    Result := WizardIsComponentSelected('portable\p_adobe_audition')
  else if ItemID = 'p_adobe_illustrator' then
    Result := WizardIsComponentSelected('portable\p_adobe_illustrator')
  else if ItemID = 'p_adobe_photoshop' then
    Result := WizardIsComponentSelected('portable\p_adobe_photoshop')
  else if ItemID = 'p_adobe_premiere' then
    Result := WizardIsComponentSelected('portable\p_adobe_premiere')
  else if ItemID = 'p_aida64' then
    Result := WizardIsComponentSelected('portable\p_aida64')
  else if ItemID = 'p_anydesk' then
    Result := WizardIsComponentSelected('portable\p_anydesk')
  else if ItemID = 'p_blender' then
    Result := WizardIsComponentSelected('portable\p_blender')
  else if ItemID = 'p_easy2boot' then
    Result := WizardIsComponentSelected('portable\p_easy2boot')
  else if ItemID = 'p_encryptonclick' then
    Result := WizardIsComponentSelected('portable\p_encryptonclick')
  else if ItemID = 'p_chrome' then
    Result := WizardIsComponentSelected('portable\p_chrome')
  else if ItemID = 'p_imgburn' then
    Result := WizardIsComponentSelected('portable\p_imgburn')
  else if ItemID = 'p_localsend' then
    Result := WizardIsComponentSelected('portable\p_localsend')
  else if ItemID = 'p_scanner' then
    Result := WizardIsComponentSelected('portable\p_scanner')
  else if ItemID = 'p_nsis' then
    Result := WizardIsComponentSelected('portable\p_nsis')
  else if ItemID = 'p_obs' then
    Result := WizardIsComponentSelected('portable\p_obs')
  else if ItemID = 'p_portablecreator' then
    Result := WizardIsComponentSelected('portable\p_portablecreator')
  else if ItemID = 'p_putty' then
    Result := WizardIsComponentSelected('portable\p_putty')
  else if ItemID = 'p_rufus' then
    Result := WizardIsComponentSelected('portable\p_rufus')
  else if ItemID = 'p_sysinternals' then
    Result := WizardIsComponentSelected('portable\p_sysinternals')
  else if ItemID = 'p_utorrent' then
    Result := WizardIsComponentSelected('portable\p_utorrent')
  else if ItemID = 'p_vlc' then
    Result := WizardIsComponentSelected('portable\p_vlc')
  else if ItemID = 'p_vscode' then
    Result := WizardIsComponentSelected('portable\p_vscode')
  else if ItemID = 'p_wifiinfoview' then
    Result := WizardIsComponentSelected('portable\p_wifiinfoview')
  else if ItemID = 'p_winnote' then
    Result := WizardIsComponentSelected('portable\p_winnote')
  else if ItemID = 'p_winpowershell' then
    Result := WizardIsComponentSelected('portable\p_winpowershell')
  else if ItemID = 'p_winrar' then
    Result := WizardIsComponentSelected('portable\p_winrar')
  else if ItemID = 'p_winscp' then
    Result := WizardIsComponentSelected('portable\p_winscp')
  else if ItemID = 'p_winsetup' then
    Result := WizardIsComponentSelected('portable\p_winsetup')
  else if ItemID = 'p_winterminal' then
    Result := WizardIsComponentSelected('portable\p_winterminal')
  else if ItemID = 'p_wnetwatcher' then
    Result := WizardIsComponentSelected('portable\p_wnetwatcher')
  else if ItemID = 's_adobe_acrobat' then
    Result := WizardIsComponentSelected('setup\s_adobe_acrobat')
  else if ItemID = 's_adobe_aftereffects' then
    Result := WizardIsComponentSelected('setup\s_adobe_aftereffects')
  else if ItemID = 's_adobe_animate' then
    Result := WizardIsComponentSelected('setup\s_adobe_animate')
  else if ItemID = 's_adobe_audition' then
    Result := WizardIsComponentSelected('setup\s_adobe_audition')
  else if ItemID = 's_adobe_lightroom' then
    Result := WizardIsComponentSelected('setup\s_adobe_lightroom')
  else if ItemID = 's_adobe_substance' then
    Result := WizardIsComponentSelected('setup\s_adobe_substance')
  else if ItemID = 's_aida64' then
    Result := WizardIsComponentSelected('setup\s_aida64')
  else if ItemID = 's_blender' then
    Result := WizardIsComponentSelected('setup\s_blender')
  else if ItemID = 's_discord' then
    Result := WizardIsComponentSelected('setup\s_discord')
  else if ItemID = 's_epic' then
    Result := WizardIsComponentSelected('setup\s_epic')
  else if ItemID = 's_flstudio' then
    Result := WizardIsComponentSelected('setup\s_flstudio')
  else if ItemID = 's_illustrator' then
    Result := WizardIsComponentSelected('setup\s_illustrator')
  else if ItemID = 's_indesign' then
    Result := WizardIsComponentSelected('setup\s_indesign')
  else if ItemID = 's_localsend' then
    Result := WizardIsComponentSelected('setup\s_localsend')
  else if ItemID = 's_office' then
    Result := WizardIsComponentSelected('setup\s_office')
  else if ItemID = 's_obs' then
    Result := WizardIsComponentSelected('setup\s_obs')
  else if ItemID = 's_photoshop' then
    Result := WizardIsComponentSelected('setup\s_photoshop')
  else if ItemID = 's_premier' then
    Result := WizardIsComponentSelected('setup\s_premier')
  else if ItemID = 's_steam' then
    Result := WizardIsComponentSelected('setup\s_steam')
  else if ItemID = 's_torrent' then
    Result := WizardIsComponentSelected('setup\s_torrent')
  else if ItemID = 's_winrar' then
    Result := WizardIsComponentSelected('setup\s_winrar')
  else if ItemID = 's_vs_vs' then
    Result := WizardIsComponentSelected('setup\visualstudio\vs')
  else if ItemID = 's_vs_code' then
    Result := WizardIsComponentSelected('setup\visualstudio\vscode')
  else if ItemID = 's_browser_chrome' then
    Result := WizardIsComponentSelected('setup\browsers\chrome')
  else if ItemID = 's_browser_firefox' then
    Result := WizardIsComponentSelected('setup\browsers\firefox')
  else if ItemID = 's_browser_edge' then
    Result := WizardIsComponentSelected('setup\browsers\edge')
  else if ItemID = 's_browser_opera' then
    Result := WizardIsComponentSelected('setup\browsers\opera')
  else if ItemID = 's_browser_yandex' then
    Result := WizardIsComponentSelected('setup\browsers\yandex')
  else if ItemID = 'a_portable' then
    Result := ArchivePage.Values[0]
  else if ItemID = 'a_setup' then
    Result := ArchivePage.Values[1]
  else
    Result := False;
end;

function HasAnySelection: Boolean;
begin
  Result :=
    (IsItemSelected('p_adobe_acrobat'))
    or (IsItemSelected('p_adobe_aftereffects'))
    or (IsItemSelected('p_adobe_audition'))
    or (IsItemSelected('p_adobe_illustrator'))
    or (IsItemSelected('p_adobe_photoshop'))
    or (IsItemSelected('p_adobe_premiere'))
    or (IsItemSelected('p_aida64'))
    or (IsItemSelected('p_anydesk'))
    or (IsItemSelected('p_blender'))
    or (IsItemSelected('p_easy2boot'))
    or (IsItemSelected('p_encryptonclick'))
    or (IsItemSelected('p_chrome'))
    or (IsItemSelected('p_imgburn'))
    or (IsItemSelected('p_localsend'))
    or (IsItemSelected('p_scanner'))
    or (IsItemSelected('p_nsis'))
    or (IsItemSelected('p_obs'))
    or (IsItemSelected('p_portablecreator'))
    or (IsItemSelected('p_putty'))
    or (IsItemSelected('p_rufus'))
    or (IsItemSelected('p_sysinternals'))
    or (IsItemSelected('p_utorrent'))
    or (IsItemSelected('p_vlc'))
    or (IsItemSelected('p_vscode'))
    or (IsItemSelected('p_wifiinfoview'))
    or (IsItemSelected('p_winnote'))
    or (IsItemSelected('p_winpowershell'))
    or (IsItemSelected('p_winrar'))
    or (IsItemSelected('p_winscp'))
    or (IsItemSelected('p_winsetup'))
    or (IsItemSelected('p_winterminal'))
    or (IsItemSelected('p_wnetwatcher'))
    or (IsItemSelected('s_adobe_acrobat'))
    or (IsItemSelected('s_adobe_aftereffects'))
    or (IsItemSelected('s_adobe_animate'))
    or (IsItemSelected('s_adobe_audition'))
    or (IsItemSelected('s_adobe_lightroom'))
    or (IsItemSelected('s_adobe_substance'))
    or (IsItemSelected('s_aida64'))
    or (IsItemSelected('s_blender'))
    or (IsItemSelected('s_discord'))
    or (IsItemSelected('s_epic'))
    or (IsItemSelected('s_flstudio'))
    or (IsItemSelected('s_illustrator'))
    or (IsItemSelected('s_indesign'))
    or (IsItemSelected('s_localsend'))
    or (IsItemSelected('s_office'))
    or (IsItemSelected('s_obs'))
    or (IsItemSelected('s_photoshop'))
    or (IsItemSelected('s_premier'))
    or (IsItemSelected('s_steam'))
    or (IsItemSelected('s_torrent'))
    or (IsItemSelected('s_winrar'))
    or (IsItemSelected('s_vs_vs'))
    or (IsItemSelected('s_vs_code'))
    or (IsItemSelected('s_browser_chrome'))
    or (IsItemSelected('s_browser_firefox'))
    or (IsItemSelected('s_browser_edge'))
    or (IsItemSelected('s_browser_opera'))
    or (IsItemSelected('s_browser_yandex'));
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := True;
  if (CurPageID = wpSelectComponents) and (not HasAnySelection) then
  begin
    MsgBox('Выберите хотя бы одну программу из каталога.', mbInformation, MB_OK);
    Result := False;
  end
  else if (CurPageID = ArchivePage.ID) and
    (not ArchivePage.Values[0]) and (not ArchivePage.Values[1]) then
  begin
    MsgBox('Выберите хотя бы один архив.', mbInformation, MB_OK);
    Result := False;
  end;
end;
