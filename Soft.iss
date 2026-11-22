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
; Интерфейс: индивидуальные страницы выбора и оформления внутри Inno Setup.
; Полная замена системной оболочки Inno Setup на отдельное приложение
; потребовала бы другого загрузчика/технологии, поэтому здесь настроены
; собственные страницы, тексты, элементы выбора и тёмное оформление.
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
AllowUNCPath=yes
UsePreviousAppDir=no
CreateAppDir=yes
DisableDirPage=no
DisableWelcomePage=yes
DisableProgramGroupPage=yes
DisableReadyMemo=yes
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
WizardSelectComponents=Выбор программ и архивов
SelectComponentsDesc=Отметьте программы или архивы, которые нужно разместить в выбранной папке.
SelectComponentsLabel2=Отметьте нужные компоненты. Вложенные пункты позволяют выбрать отдельные программы.
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
Name: "portable"; Description: "Портативные программы"; Types: custom; Flags: fixed
Name: "portable\p_adobe_acrobat"; Description: "Adobe Acrobat Pro"; Types: custom; Flags: unchecked
Name: "portable\p_adobe_aftereffects"; Description: "Adobe After Effects"; Types: custom; Flags: unchecked
Name: "portable\p_adobe_audition"; Description: "Adobe Audition"; Types: custom; Flags: unchecked
Name: "portable\p_adobe_illustrator"; Description: "Adobe Illustrator"; Types: custom; Flags: unchecked
Name: "portable\p_adobe_photoshop"; Description: "Adobe Photoshop"; Types: custom; Flags: unchecked
Name: "portable\p_adobe_premiere"; Description: "Adobe Premiere Pro"; Types: custom; Flags: unchecked
Name: "portable\p_aida64"; Description: "AIDA64"; Types: custom; Flags: unchecked
Name: "portable\p_anydesk"; Description: "AnyDesk"; Types: custom; Flags: unchecked
Name: "portable\p_blender"; Description: "Blender"; Types: custom; Flags: unchecked
Name: "portable\p_easy2boot"; Description: "Easy2Boot"; Types: custom; Flags: unchecked
Name: "portable\p_encryptonclick"; Description: "EncryptOnClick"; Types: custom; Flags: unchecked
Name: "portable\p_chrome"; Description: "Google Chrome"; Types: custom; Flags: unchecked
Name: "portable\p_imgburn"; Description: "ImgBurn"; Types: custom; Flags: unchecked
Name: "portable\p_localsend"; Description: "LocalSend"; Types: custom; Flags: unchecked
Name: "portable\p_scanner"; Description: "Microsoft Scanner"; Types: custom; Flags: unchecked
Name: "portable\p_nsis"; Description: "NSIS"; Types: custom; Flags: unchecked
Name: "portable\p_obs"; Description: "OBS Studio"; Types: custom; Flags: unchecked
Name: "portable\p_portablecreator"; Description: "Portable Creator"; Types: custom; Flags: unchecked
Name: "portable\p_putty"; Description: "PuTTY"; Types: custom; Flags: unchecked
Name: "portable\p_rufus"; Description: "Rufus"; Types: custom; Flags: unchecked
Name: "portable\p_sysinternals"; Description: "Sysinternals Suite"; Types: custom; Flags: unchecked
Name: "portable\p_utorrent"; Description: "µTorrent"; Types: custom; Flags: unchecked
Name: "portable\p_vlc"; Description: "VLC Media Player"; Types: custom; Flags: unchecked
Name: "portable\p_vscode"; Description: "Visual Studio Code"; Types: custom; Flags: unchecked
Name: "portable\p_wifiinfoview"; Description: "WifiInfoView"; Types: custom; Flags: unchecked
Name: "portable\p_winnote"; Description: "WinNotepad"; Types: custom; Flags: unchecked
Name: "portable\p_winpowershell"; Description: "WinPowerShell"; Types: custom; Flags: unchecked
Name: "portable\p_winrar"; Description: "WinRAR"; Types: custom; Flags: unchecked
Name: "portable\p_winscp"; Description: "WinSCP"; Types: custom; Flags: unchecked
Name: "portable\p_winsetup"; Description: "WinSetupFromUSB"; Types: custom; Flags: unchecked
Name: "portable\p_winterminal"; Description: "Windows Terminal"; Types: custom; Flags: unchecked
Name: "portable\p_wnetwatcher"; Description: "WNetWatcher"; Types: custom; Flags: unchecked
Name: "setup"; Description: "Установщики программ"; Types: custom; Flags: fixed
Name: "setup\s_adobe_acrobat"; Description: "Adobe Acrobat Pro"; Types: custom; Flags: unchecked
Name: "setup\s_adobe_aftereffects"; Description: "Adobe After Effects"; Types: custom; Flags: unchecked
Name: "setup\s_adobe_animate"; Description: "Adobe Animate"; Types: custom; Flags: unchecked
Name: "setup\s_adobe_audition"; Description: "Adobe Audition"; Types: custom; Flags: unchecked
Name: "setup\s_adobe_lightroom"; Description: "Adobe Lightroom Classic"; Types: custom; Flags: unchecked
Name: "setup\s_adobe_substance"; Description: "Adobe Substance 3D Painter"; Types: custom; Flags: unchecked
Name: "setup\s_aida64"; Description: "AIDA 64"; Types: custom; Flags: unchecked
Name: "setup\s_blender"; Description: "Blender 3D"; Types: custom; Flags: unchecked
Name: "setup\s_discord"; Description: "Discord"; Types: custom; Flags: unchecked
Name: "setup\s_epic"; Description: "Epic Games"; Types: custom; Flags: unchecked
Name: "setup\s_flstudio"; Description: "FL Studio"; Types: custom; Flags: unchecked
Name: "setup\s_illustrator"; Description: "Adobe Illustrator"; Types: custom; Flags: unchecked
Name: "setup\s_indesign"; Description: "Adobe InDesign"; Types: custom; Flags: unchecked
Name: "setup\s_localsend"; Description: "LocalSend"; Types: custom; Flags: unchecked
Name: "setup\s_office"; Description: "Microsoft Office"; Types: custom; Flags: unchecked
Name: "setup\s_obs"; Description: "OBS Studio"; Types: custom; Flags: unchecked
Name: "setup\s_photoshop"; Description: "Adobe Photoshop"; Types: custom; Flags: unchecked
Name: "setup\s_premier"; Description: "Adobe Premiere Pro"; Types: custom; Flags: unchecked
Name: "setup\s_steam"; Description: "Steam"; Types: custom; Flags: unchecked
Name: "setup\s_torrent"; Description: "Torrent"; Types: custom; Flags: unchecked
Name: "setup\s_winrar"; Description: "WinRAR"; Types: custom; Flags: unchecked
Name: "setup\visualstudio"; Description: "Visual Studio (все версии)"; Types: custom
Name: "setup\visualstudio\vs"; Description: "Visual Studio"; Types: custom; Flags: unchecked
Name: "setup\visualstudio\vscode"; Description: "Visual Studio Code"; Types: custom; Flags: unchecked
Name: "setup\browsers"; Description: "Браузеры (все сразу)"; Types: custom
Name: "setup\browsers\chrome"; Description: "Google Chrome"; Types: custom; Flags: unchecked
Name: "setup\browsers\firefox"; Description: "Mozilla Firefox"; Types: custom; Flags: unchecked
Name: "setup\browsers\edge"; Description: "Microsoft Edge"; Types: custom; Flags: unchecked
Name: "setup\browsers\opera"; Description: "Opera"; Types: custom; Flags: unchecked
Name: "setup\browsers\yandex"; Description: "Яндекс Браузер"; Types: custom; Flags: unchecked
Name: "archives"; Description: "Готовые архивы"; Types: custom; Flags: fixed
Name: "archives\portable"; Description: "Архив с портативными программами"; Types: custom; Flags: unchecked
Name: "archives\setup"; Description: "Архив с установочными версиями программ"; Types: custom; Flags: unchecked

[Files]
Source: "{#PortableRoot}\AdobeAcrobatPro-Portable\*"; DestDir: "{code:GetTargetFolder|AdobeAcrobatPro-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('p_adobe_acrobat')
Source: "{#PortableRoot}\AdobeAfterEffects-Portable\*"; DestDir: "{code:GetTargetFolder|AdobeAfterEffects-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('p_adobe_aftereffects')
Source: "{#PortableRoot}\AdobeAudition-Portable\*"; DestDir: "{code:GetTargetFolder|AdobeAudition-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('p_adobe_audition')
Source: "{#PortableRoot}\AdobeIllustrator-Portable\*"; DestDir: "{code:GetTargetFolder|AdobeIllustrator-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('p_adobe_illustrator')
Source: "{#PortableRoot}\AdobePhotoshop-Portable\*"; DestDir: "{code:GetTargetFolder|AdobePhotoshop-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('p_adobe_photoshop')
Source: "{#PortableRoot}\AdobePremierePro-Portable\*"; DestDir: "{code:GetTargetFolder|AdobePremierePro-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('p_adobe_premiere')
Source: "{#PortableRoot}\AIDA64-Portable\*"; DestDir: "{code:GetTargetFolder|AIDA64-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('p_aida64')
Source: "{#PortableRoot}\AnyDesk-Portable\*"; DestDir: "{code:GetTargetFolder|AnyDesk-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('p_anydesk')
Source: "{#PortableRoot}\Blender-Portable\*"; DestDir: "{code:GetTargetFolder|Blender-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('p_blender')
Source: "{#PortableRoot}\Easy2Boot-Portable\*"; DestDir: "{code:GetTargetFolder|Easy2Boot-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('p_easy2boot')
Source: "{#PortableRoot}\EncryptOnClick-Portable\*"; DestDir: "{code:GetTargetFolder|EncryptOnClick-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('p_encryptonclick')
Source: "{#PortableRoot}\GoogleChrome-Portable\*"; DestDir: "{code:GetTargetFolder|GoogleChrome-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('p_chrome')
Source: "{#PortableRoot}\ImgBurn-Portable\*"; DestDir: "{code:GetTargetFolder|ImgBurn-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('p_imgburn')
Source: "{#PortableRoot}\LocalSend-Portable\*"; DestDir: "{code:GetTargetFolder|LocalSend-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('p_localsend')
Source: "{#PortableRoot}\MicrosoftScaner-Portable\*"; DestDir: "{code:GetTargetFolder|MicrosoftScaner-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('p_scanner')
Source: "{#PortableRoot}\NSIS-Portable\*"; DestDir: "{code:GetTargetFolder|NSIS-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('p_nsis')
Source: "{#PortableRoot}\OBS-Studio-Portable\*"; DestDir: "{code:GetTargetFolder|OBS-Studio-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('p_obs')
Source: "{#PortableRoot}\PortableCreator-Portable\*"; DestDir: "{code:GetTargetFolder|PortableCreator-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('p_portablecreator')
Source: "{#PortableRoot}\PuTTY-Portable\*"; DestDir: "{code:GetTargetFolder|PuTTY-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('p_putty')
Source: "{#PortableRoot}\Rufus-Portable\*"; DestDir: "{code:GetTargetFolder|Rufus-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('p_rufus')
Source: "{#PortableRoot}\SysinternalsSuite-Portable\*"; DestDir: "{code:GetTargetFolder|SysinternalsSuite-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('p_sysinternals')
Source: "{#PortableRoot}\uTorrent-Portable\*"; DestDir: "{code:GetTargetFolder|uTorrent-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('p_utorrent')
Source: "{#PortableRoot}\VlcMediaPlayer-Portable\*"; DestDir: "{code:GetTargetFolder|VlcMediaPlayer-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('p_vlc')
Source: "{#PortableRoot}\VSCode-Portable\*"; DestDir: "{code:GetTargetFolder|VSCode-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('p_vscode')
Source: "{#PortableRoot}\Wifiinfoview-Portable\*"; DestDir: "{code:GetTargetFolder|Wifiinfoview-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('p_wifiinfoview')
Source: "{#PortableRoot}\WinNotepad-Portable\*"; DestDir: "{code:GetTargetFolder|WinNotepad-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('p_winnote')
Source: "{#PortableRoot}\WinPowerShel-Portable\*"; DestDir: "{code:GetTargetFolder|WinPowerShel-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('p_winpowershell')
Source: "{#PortableRoot}\WinRAR-Portable\*"; DestDir: "{code:GetTargetFolder|WinRAR-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('p_winrar')
Source: "{#PortableRoot}\WinSCP-Portable\*"; DestDir: "{code:GetTargetFolder|WinSCP-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('p_winscp')
Source: "{#PortableRoot}\WinSetupFromUSB-Portable\*"; DestDir: "{code:GetTargetFolder|WinSetupFromUSB-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('p_winsetup')
Source: "{#PortableRoot}\WinTerminal-Portable\*"; DestDir: "{code:GetTargetFolder|WinTerminal-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('p_winterminal')
Source: "{#PortableRoot}\Wnet-Watcher-Portable\*"; DestDir: "{code:GetTargetFolder|Wnet-Watcher-Portable}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('p_wnetwatcher')
Source: "{#SetupRoot}\Adobe Acrobat Pro\*"; DestDir: "{code:GetTargetFolder|Adobe Acrobat Pro}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('s_adobe_acrobat')
Source: "{#SetupRoot}\Adobe After Effects\*"; DestDir: "{code:GetTargetFolder|Adobe After Effects}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('s_adobe_aftereffects')
Source: "{#SetupRoot}\Adobe Animate\*"; DestDir: "{code:GetTargetFolder|Adobe Animate}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('s_adobe_animate')
Source: "{#SetupRoot}\Adobe Audition\*"; DestDir: "{code:GetTargetFolder|Adobe Audition}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('s_adobe_audition')
Source: "{#SetupRoot}\Adobe Lightroom Classic\*"; DestDir: "{code:GetTargetFolder|Adobe Lightroom Classic}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('s_adobe_lightroom')
Source: "{#SetupRoot}\Adobe Substance 3D Painter\*"; DestDir: "{code:GetTargetFolder|Adobe Substance 3D Painter}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('s_adobe_substance')
Source: "{#SetupRoot}\AIDA 64\*"; DestDir: "{code:GetTargetFolder|AIDA 64}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('s_aida64')
Source: "{#SetupRoot}\Blender 3D\*"; DestDir: "{code:GetTargetFolder|Blender 3D}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('s_blender')
Source: "{#SetupRoot}\Discord\*"; DestDir: "{code:GetTargetFolder|Discord}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('s_discord')
Source: "{#SetupRoot}\Epic Games\*"; DestDir: "{code:GetTargetFolder|Epic Games}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('s_epic')
Source: "{#SetupRoot}\FL Studio\*"; DestDir: "{code:GetTargetFolder|FL Studio}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('s_flstudio')
Source: "{#SetupRoot}\Illustrator\*"; DestDir: "{code:GetTargetFolder|Illustrator}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('s_illustrator')
Source: "{#SetupRoot}\InDesign\*"; DestDir: "{code:GetTargetFolder|InDesign}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('s_indesign')
Source: "{#SetupRoot}\LocalSend\*"; DestDir: "{code:GetTargetFolder|LocalSend}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('s_localsend')
Source: "{#SetupRoot}\Microsoft Office\*"; DestDir: "{code:GetTargetFolder|Microsoft Office}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('s_office')
Source: "{#SetupRoot}\OBS Studio\*"; DestDir: "{code:GetTargetFolder|OBS Studio}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('s_obs')
Source: "{#SetupRoot}\Photoshop\*"; DestDir: "{code:GetTargetFolder|Photoshop}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('s_photoshop')
Source: "{#SetupRoot}\Premier\*"; DestDir: "{code:GetTargetFolder|Premier}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('s_premier')
Source: "{#SetupRoot}\Steam\*"; DestDir: "{code:GetTargetFolder|Steam}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('s_steam')
Source: "{#SetupRoot}\Torrent\*"; DestDir: "{code:GetTargetFolder|Torrent}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('s_torrent')
Source: "{#SetupRoot}\WinRar\*"; DestDir: "{code:GetTargetFolder|WinRar}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('s_winrar')
Source: "{#SetupRoot}\Visual Studio (and Code version)\VS\*"; DestDir: "{code:GetTargetFolder|Visual Studio (and Code version)\VS}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('s_vs_vs')
Source: "{#SetupRoot}\Visual Studio (and Code version)\VS Code\*"; DestDir: "{code:GetTargetFolder|Visual Studio (and Code version)\VS Code}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('s_vs_code')
Source: "{#SetupRoot}\Браузеры\ChromeSetup.exe"; DestDir: "{code:GetTargetFolder|Браузеры}"; Flags: ignoreversion; Check: IsItemSelected('s_browser_chrome')
Source: "{#SetupRoot}\Браузеры\Firefox Installer.exe"; DestDir: "{code:GetTargetFolder|Браузеры}"; Flags: ignoreversion; Check: IsItemSelected('s_browser_firefox')
Source: "{#SetupRoot}\Браузеры\MicrosoftEdgeSetup.exe"; DestDir: "{code:GetTargetFolder|Браузеры}"; Flags: ignoreversion; Check: IsItemSelected('s_browser_edge')
Source: "{#SetupRoot}\Браузеры\OperaSetup.exe"; DestDir: "{code:GetTargetFolder|Браузеры}"; Flags: ignoreversion; Check: IsItemSelected('s_browser_opera')
Source: "{#SetupRoot}\Браузеры\Yandex.exe"; DestDir: "{code:GetTargetFolder|Браузеры}"; Flags: ignoreversion; Check: IsItemSelected('s_browser_yandex')
Source: "{#PortableArchiveRoot}\Софт-Portable.rar"; DestDir: "{code:GetDestinationPath}"; Flags: ignoreversion; Check: IsItemSelected('a_portable')
Source: "{#PortableArchiveRoot}\Информация об архиве - Софт-Portable.txt"; DestDir: "{code:GetDestinationPath}"; Flags: ignoreversion; Check: IsItemSelected('a_portable')
Source: "{#SetupArchiveRoot}\Софт-SetUp.rar"; DestDir: "{code:GetDestinationPath}"; Flags: ignoreversion; Check: IsItemSelected('a_setup')
Source: "{#SetupArchiveRoot}\Информация об архиве - Софт-SetUp.txt"; DestDir: "{code:GetDestinationPath}"; Flags: ignoreversion; Check: IsItemSelected('a_setup')

[Code]

function IsItemSelected(const ItemID: String): Boolean;
begin
  if ItemID = 'a_portable' then
    Result := IsComponentSelected('archives\portable')
  else if ItemID = 'a_setup' then
    Result := IsComponentSelected('archives\setup')
  else if ItemID = 's_vs_vs' then
    Result := IsComponentSelected('setup\visualstudio\vs')
  else if ItemID = 's_vs_code' then
    Result := IsComponentSelected('setup\visualstudio\vscode')
  else if ItemID = 's_browser_chrome' then
    Result := IsComponentSelected('setup\browsers\chrome')
  else if ItemID = 's_browser_firefox' then
    Result := IsComponentSelected('setup\browsers\firefox')
  else if ItemID = 's_browser_edge' then
    Result := IsComponentSelected('setup\browsers\edge')
  else if ItemID = 's_browser_opera' then
    Result := IsComponentSelected('setup\browsers\opera')
  else if ItemID = 's_browser_yandex' then
    Result := IsComponentSelected('setup\browsers\yandex')
  else if Copy(ItemID, 1, 2) = 'p_' then
    Result := IsComponentSelected('portable\' + ItemID)
  else if Copy(ItemID, 1, 2) = 's_' then
    Result := IsComponentSelected('setup\' + ItemID)
  else
    Result := False;
end;

function HasAnySelection: Boolean;
begin
  Result := IsComponentSelected('portable\p_adobe_acrobat')
    or IsComponentSelected('portable\p_adobe_aftereffects')
    or IsComponentSelected('portable\p_adobe_audition')
    or IsComponentSelected('portable\p_adobe_illustrator')
    or IsComponentSelected('portable\p_adobe_photoshop')
    or IsComponentSelected('portable\p_adobe_premiere')
    or IsComponentSelected('portable\p_aida64')
    or IsComponentSelected('portable\p_anydesk')
    or IsComponentSelected('portable\p_blender')
    or IsComponentSelected('portable\p_easy2boot')
    or IsComponentSelected('portable\p_encryptonclick')
    or IsComponentSelected('portable\p_chrome')
    or IsComponentSelected('portable\p_imgburn')
    or IsComponentSelected('portable\p_localsend')
    or IsComponentSelected('portable\p_scanner')
    or IsComponentSelected('portable\p_nsis')
    or IsComponentSelected('portable\p_obs')
    or IsComponentSelected('portable\p_portablecreator')
    or IsComponentSelected('portable\p_putty')
    or IsComponentSelected('portable\p_rufus')
    or IsComponentSelected('portable\p_sysinternals')
    or IsComponentSelected('portable\p_utorrent')
    or IsComponentSelected('portable\p_vlc')
    or IsComponentSelected('portable\p_vscode')
    or IsComponentSelected('portable\p_wifiinfoview')
    or IsComponentSelected('portable\p_winnote')
    or IsComponentSelected('portable\p_winpowershell')
    or IsComponentSelected('portable\p_winrar')
    or IsComponentSelected('portable\p_winscp')
    or IsComponentSelected('portable\p_winsetup')
    or IsComponentSelected('portable\p_winterminal')
    or IsComponentSelected('portable\p_wnetwatcher')
    or IsComponentSelected('setup\s_adobe_acrobat')
    or IsComponentSelected('setup\s_adobe_aftereffects')
    or IsComponentSelected('setup\s_adobe_animate')
    or IsComponentSelected('setup\s_adobe_audition')
    or IsComponentSelected('setup\s_adobe_lightroom')
    or IsComponentSelected('setup\s_adobe_substance')
    or IsComponentSelected('setup\s_aida64')
    or IsComponentSelected('setup\s_blender')
    or IsComponentSelected('setup\s_discord')
    or IsComponentSelected('setup\s_epic')
    or IsComponentSelected('setup\s_flstudio')
    or IsComponentSelected('setup\s_illustrator')
    or IsComponentSelected('setup\s_indesign')
    or IsComponentSelected('setup\s_localsend')
    or IsComponentSelected('setup\s_office')
    or IsComponentSelected('setup\s_obs')
    or IsComponentSelected('setup\s_photoshop')
    or IsComponentSelected('setup\s_premier')
    or IsComponentSelected('setup\s_steam')
    or IsComponentSelected('setup\s_torrent')
    or IsComponentSelected('setup\s_winrar')
    or IsComponentSelected('setup\visualstudio\vs')
    or IsComponentSelected('setup\visualstudio\vscode')
    or IsComponentSelected('setup\browsers\chrome')
    or IsComponentSelected('setup\browsers\firefox')
    or IsComponentSelected('setup\browsers\edge')
    or IsComponentSelected('setup\browsers\opera')
    or IsComponentSelected('setup\browsers\yandex')
    or IsComponentSelected('archives\portable')
    or IsComponentSelected('archives\setup');
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := True;
  if (CurPageID = wpSelectComponents) and (not HasAnySelection) then
  begin
    MsgBox('Выберите хотя бы одну программу или архив.', mbInformation, MB_OK);
    Result := False;
  end;
end;
