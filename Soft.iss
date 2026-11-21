#define MyAppName "Софт"
#define MyAppPublisher "MyCompany"

[Setup]
AppId={{8D9C3E1A-4E2B-9F11-1234567890AB}
AppName={#MyAppName}
AppVerName=Софт
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\{#MyAppName}
DisableDirPage=no
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputDir=E:\ДЛЯ ВСЕГО\MYSOFT\Софт\Софт - установка
OutputBaseFilename=SoftSetup
Compression=lzma2/max
SolidCompression=yes
DiskSpanning=no
WizardStyle=modern dark
WizardSizePercent=100
SetupIconFile=E:\ДЛЯ ВСЕГО\MYSOFT\app.ico
PrivilegesRequired=admin
Uninstallable=yes
DefaultDialogFontName=Segoe UI

[Languages]
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"

[LangOptions]
DialogFontName=Segoe UI
DialogFontSize=9
WelcomeFontName=Segoe UI
WelcomeFontSize=14

[Types]
Name: "full"; Description: "Полная коллекция"; Flags: isfull
Name: "custom"; Description: "Выборочная установка"; Flags: iscustom

[Components]
Name: "portable"; Description: "Каталог программ — Portable"; Types: full custom
Name: "portable.archive"; Description: "Архив Софт-Portable.rar"; Types: full custom
Name: "portable.info"; Description: "Описание архива Portable"; Types: full custom
Name: "portable.programs"; Description: "Программы без архива — Portable"; Types: full custom
Name: "portable.programs.adobe"; Description: "Adobe"; Types: full custom
Name: "portable.programs."; Description: "Утилиты"; Types: full custom
Name: "portable.programs."; Description: "Браузеры"; Types: full custom
Name: "portable.programs."; Description: "Офис"; Types: full custom
Name: "portable.programs."; Description: "Сеть"; Types: full custom
Name: "portable.programs."; Description: "Мультимедиа"; Types: full custom
Name: "portable.programs."; Description: "Разработка"; Types: full custom
Name: "portable.programs."; Description: "Загрузки"; Types: full custom
Name: "portable.programs.adobe.adobeacrobatpro_portable"; Description: "AdobeAcrobatPro"; Types: full custom
Name: "portable.programs.adobe.adobeaftereffects_portable"; Description: "AdobeAfterEffects"; Types: full custom
Name: "portable.programs.adobe.adobeaudition_portable"; Description: "AdobeAudition"; Types: full custom
Name: "portable.programs.adobe.adobeillustrator_portable"; Description: "AdobeIllustrator"; Types: full custom
Name: "portable.programs.adobe.adobephotoshop_portable"; Description: "AdobePhotoshop"; Types: full custom
Name: "portable.programs.adobe.adobepremierepro_portable"; Description: "AdobePremierePro"; Types: full custom
Name: "portable.programs..aida64_portable"; Description: "AIDA64"; Types: full custom
Name: "portable.programs..anydesk_portable"; Description: "AnyDesk"; Types: full custom
Name: "portable.programs..blender_portable"; Description: "Blender"; Types: full custom
Name: "portable.programs..easy2boot_portable"; Description: "Easy2Boot"; Types: full custom
Name: "portable.programs..encryptonclick_portable"; Description: "EncryptOnClick"; Types: full custom
Name: "portable.programs..googlechrome_portable"; Description: "GoogleChrome"; Types: full custom
Name: "portable.programs..imgburn_portable"; Description: "ImgBurn"; Types: full custom
Name: "portable.programs..libreoffice_portable"; Description: "LibreOffice"; Types: full custom
Name: "portable.programs..localsend_portable"; Description: "LocalSend"; Types: full custom
Name: "portable.programs..microsoftscaner_portable"; Description: "MicrosoftScaner"; Types: full custom
Name: "portable.programs..nsis_portable"; Description: "NSIS"; Types: full custom
Name: "portable.programs..obs_studio_portable"; Description: "OBS-Studio"; Types: full custom
Name: "portable.programs..portablecreator_portable"; Description: "PortableCreator"; Types: full custom
Name: "portable.programs..putty_portable"; Description: "PuTTY"; Types: full custom
Name: "portable.programs..rufus_portable"; Description: "Rufus"; Types: full custom
Name: "portable.programs..sysinternalssuite_portable"; Description: "SysinternalsSuite"; Types: full custom
Name: "portable.programs..utorrent_portable"; Description: "uTorrent"; Types: full custom
Name: "portable.programs..vlcmediaplayer_portable"; Description: "VlcMediaPlayer"; Types: full custom
Name: "portable.programs..vscode_portable"; Description: "VSCode"; Types: full custom
Name: "portable.programs..wifiinfoview_portable"; Description: "Wifiinfoview"; Types: full custom
Name: "portable.programs..winnotepad_portable"; Description: "WinNotepad"; Types: full custom
Name: "portable.programs..winpowershel_portable"; Description: "WinPowerShel"; Types: full custom
Name: "portable.programs..winrar_portable"; Description: "WinRAR"; Types: full custom
Name: "portable.programs..winscp_portable"; Description: "WinSCP"; Types: full custom
Name: "portable.programs..winsetupfromusb_portable"; Description: "WinSetupFromUSB"; Types: full custom
Name: "portable.programs..winterminal_portable"; Description: "WinTerminal"; Types: full custom
Name: "portable.programs..wnet_watcher_portable"; Description: "Wnet-Watcher"; Types: full custom
Name: "setup"; Description: "Архивы и отдельные файлы — Setup"; Types: full custom
Name: "setup.archive"; Description: "Архив Софт-SetUp.rar"; Types: full custom
Name: "setup.info"; Description: "Описание архива Setup"; Types: full custom
Name: "setup.programs"; Description: "Установочные программы и образы"; Types: full custom
Name: "setup.programs.adobe_acrobat_pro"; Description: "Adobe Acrobat Pro"; Types: full custom
Name: "setup.programs.adobe_after_effects"; Description: "Adobe After Effects"; Types: full custom
Name: "setup.programs.adobe_animate"; Description: "Adobe Animate"; Types: full custom
Name: "setup.programs.adobe_audition"; Description: "Adobe Audition"; Types: full custom
Name: "setup.programs.adobe_lightroom_classic"; Description: "Adobe Lightroom Classic"; Types: full custom
Name: "setup.programs.adobe_substance_3d_painter"; Description: "Adobe Substance 3D Painter"; Types: full custom
Name: "setup.programs.aida_64"; Description: "AIDA 64"; Types: full custom
Name: "setup.programs.blender_3d"; Description: "Blender 3D"; Types: full custom
Name: "setup.programs.discord"; Description: "Discord"; Types: full custom
Name: "setup.programs.epic_games"; Description: "Epic Games"; Types: full custom
Name: "setup.programs.fl_studio"; Description: "FL Studio"; Types: full custom
Name: "setup.programs.illustrator"; Description: "Illustrator"; Types: full custom
Name: "setup.programs.indesign"; Description: "InDesign"; Types: full custom
Name: "setup.programs.localsend"; Description: "LocalSend"; Types: full custom
Name: "setup.programs.microsoft_office"; Description: "Microsoft Office"; Types: full custom
Name: "setup.programs.obs_studio"; Description: "OBS Studio"; Types: full custom
Name: "setup.programs.photoshop"; Description: "Photoshop"; Types: full custom
Name: "setup.programs.premier"; Description: "Premier"; Types: full custom
Name: "setup.programs.steam"; Description: "Steam"; Types: full custom
Name: "setup.programs.torrent"; Description: "Torrent"; Types: full custom
Name: "setup.programs.windows_and_microsoft_office_kms_auto"; Description: "Windows and Microsoft Office (KMS Auto)"; Types: full custom
Name: "setup.programs.winrar"; Description: "WinRar"; Types: full custom
Name: "setup.programs.visualstudio"; Description: "Visual Studio"; Types: full custom
Name: "setup.programs.vscode"; Description: "Visual Studio Code"; Types: full custom
Name: "setup.programs.browser"; Description: "Браузеры"; Types: full custom
Name: "setup.programs.browser.chrome"; Description: "Google Chrome"; Types: full custom
Name: "setup.programs.browser.firefox"; Description: "Mozilla Firefox"; Types: full custom
Name: "setup.programs.browser.edge"; Description: "Microsoft Edge"; Types: full custom
Name: "setup.programs.browser.opera"; Description: "Opera"; Types: full custom
Name: "setup.programs.browser.yandex"; Description: "Яндекс Браузер"; Types: full custom
Name: "setup.readme"; Description: "Руководства ReadMe"; Types: full custom

[Files]
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт\ReadMe (Software Installation Guide).docx"; DestDir: "{app}\Документы"; Components: setup.readme; Flags: ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт\ReadMe (Software Installation Guide).txt"; DestDir: "{app}\Документы"; Components: setup.readme; Flags: ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Софт-Portable.rar"; DestDir: "{app}\Архивы"; Components: portable.archive; Flags: ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Информация об архиве - Софт-Portable.txt"; DestDir: "{app}\Архивы"; Components: portable.info; Flags: ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-SetUp\Софт-SetUp.rar"; DestDir: "{app}\Архивы"; Components: setup.archive; Flags: ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-SetUp\Информация об архиве - Софт-SetUp.txt"; DestDir: "{app}\Архивы"; Components: setup.info; Flags: ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\AdobeAcrobatPro-Portable\*"; DestDir: "{app}\Portable\AdobeAcrobatPro-Portable"; Components: portable.programs.adobe.adobeacrobatpro_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\AdobeAfterEffects-Portable\*"; DestDir: "{app}\Portable\AdobeAfterEffects-Portable"; Components: portable.programs.adobe.adobeaftereffects_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\AdobeAudition-Portable\*"; DestDir: "{app}\Portable\AdobeAudition-Portable"; Components: portable.programs.adobe.adobeaudition_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\AdobeIllustrator-Portable\*"; DestDir: "{app}\Portable\AdobeIllustrator-Portable"; Components: portable.programs.adobe.adobeillustrator_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\AdobePhotoshop-Portable\*"; DestDir: "{app}\Portable\AdobePhotoshop-Portable"; Components: portable.programs.adobe.adobephotoshop_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\AdobePremierePro-Portable\*"; DestDir: "{app}\Portable\AdobePremierePro-Portable"; Components: portable.programs.adobe.adobepremierepro_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\AIDA64-Portable\*"; DestDir: "{app}\Portable\AIDA64-Portable"; Components: portable.programs..aida64_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\AnyDesk-Portable\*"; DestDir: "{app}\Portable\AnyDesk-Portable"; Components: portable.programs..anydesk_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\Blender-Portable\*"; DestDir: "{app}\Portable\Blender-Portable"; Components: portable.programs..blender_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\Easy2Boot-Portable\*"; DestDir: "{app}\Portable\Easy2Boot-Portable"; Components: portable.programs..easy2boot_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\EncryptOnClick-Portable\*"; DestDir: "{app}\Portable\EncryptOnClick-Portable"; Components: portable.programs..encryptonclick_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\GoogleChrome-Portable\*"; DestDir: "{app}\Portable\GoogleChrome-Portable"; Components: portable.programs..googlechrome_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\ImgBurn-Portable\*"; DestDir: "{app}\Portable\ImgBurn-Portable"; Components: portable.programs..imgburn_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\LibreOffice-Portable\*"; DestDir: "{app}\Portable\LibreOffice-Portable"; Components: portable.programs..libreoffice_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\LocalSend-Portable\*"; DestDir: "{app}\Portable\LocalSend-Portable"; Components: portable.programs..localsend_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\MicrosoftScaner-Portable\*"; DestDir: "{app}\Portable\MicrosoftScaner-Portable"; Components: portable.programs..microsoftscaner_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\NSIS-Portable\*"; DestDir: "{app}\Portable\NSIS-Portable"; Components: portable.programs..nsis_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\OBS-Studio-Portable\*"; DestDir: "{app}\Portable\OBS-Studio-Portable"; Components: portable.programs..obs_studio_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\PortableCreator-Portable\*"; DestDir: "{app}\Portable\PortableCreator-Portable"; Components: portable.programs..portablecreator_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\PuTTY-Portable\*"; DestDir: "{app}\Portable\PuTTY-Portable"; Components: portable.programs..putty_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\Rufus-Portable\*"; DestDir: "{app}\Portable\Rufus-Portable"; Components: portable.programs..rufus_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\SysinternalsSuite-Portable\*"; DestDir: "{app}\Portable\SysinternalsSuite-Portable"; Components: portable.programs..sysinternalssuite_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\uTorrent-Portable\*"; DestDir: "{app}\Portable\uTorrent-Portable"; Components: portable.programs..utorrent_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\VlcMediaPlayer-Portable\*"; DestDir: "{app}\Portable\VlcMediaPlayer-Portable"; Components: portable.programs..vlcmediaplayer_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\VSCode-Portable\*"; DestDir: "{app}\Portable\VSCode-Portable"; Components: portable.programs..vscode_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\Wifiinfoview-Portable\*"; DestDir: "{app}\Portable\Wifiinfoview-Portable"; Components: portable.programs..wifiinfoview_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\WinNotepad-Portable\*"; DestDir: "{app}\Portable\WinNotepad-Portable"; Components: portable.programs..winnotepad_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\WinPowerShel-Portable\*"; DestDir: "{app}\Portable\WinPowerShel-Portable"; Components: portable.programs..winpowershel_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\WinRAR-Portable\*"; DestDir: "{app}\Portable\WinRAR-Portable"; Components: portable.programs..winrar_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\WinSCP-Portable\*"; DestDir: "{app}\Portable\WinSCP-Portable"; Components: portable.programs..winscp_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\WinSetupFromUSB-Portable\*"; DestDir: "{app}\Portable\WinSetupFromUSB-Portable"; Components: portable.programs..winsetupfromusb_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\WinTerminal-Portable\*"; DestDir: "{app}\Portable\WinTerminal-Portable"; Components: portable.programs..winterminal_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-Portable\Программы без архива-Portable\Wnet-Watcher-Portable\*"; DestDir: "{app}\Portable\Wnet-Watcher-Portable"; Components: portable.programs..wnet_watcher_portable; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Adobe Acrobat Pro\*"; DestDir: "{app}\Setup\Adobe Acrobat Pro"; Components: setup.programs.adobe_acrobat_pro; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Adobe After Effects\*"; DestDir: "{app}\Setup\Adobe After Effects"; Components: setup.programs.adobe_after_effects; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Adobe Animate\*"; DestDir: "{app}\Setup\Adobe Animate"; Components: setup.programs.adobe_animate; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Adobe Audition\*"; DestDir: "{app}\Setup\Adobe Audition"; Components: setup.programs.adobe_audition; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Adobe Lightroom Classic\*"; DestDir: "{app}\Setup\Adobe Lightroom Classic"; Components: setup.programs.adobe_lightroom_classic; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Adobe Substance 3D Painter\*"; DestDir: "{app}\Setup\Adobe Substance 3D Painter"; Components: setup.programs.adobe_substance_3d_painter; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\AIDA 64\*"; DestDir: "{app}\Setup\AIDA 64"; Components: setup.programs.aida_64; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Blender 3D\*"; DestDir: "{app}\Setup\Blender 3D"; Components: setup.programs.blender_3d; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Discord\*"; DestDir: "{app}\Setup\Discord"; Components: setup.programs.discord; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Epic Games\*"; DestDir: "{app}\Setup\Epic Games"; Components: setup.programs.epic_games; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\FL Studio\*"; DestDir: "{app}\Setup\FL Studio"; Components: setup.programs.fl_studio; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Illustrator\*"; DestDir: "{app}\Setup\Illustrator"; Components: setup.programs.illustrator; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\InDesign\*"; DestDir: "{app}\Setup\InDesign"; Components: setup.programs.indesign; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\LocalSend\*"; DestDir: "{app}\Setup\LocalSend"; Components: setup.programs.localsend; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Microsoft Office\*"; DestDir: "{app}\Setup\Microsoft Office"; Components: setup.programs.microsoft_office; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\OBS Studio\*"; DestDir: "{app}\Setup\OBS Studio"; Components: setup.programs.obs_studio; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Photoshop\*"; DestDir: "{app}\Setup\Photoshop"; Components: setup.programs.photoshop; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Premier\*"; DestDir: "{app}\Setup\Premier"; Components: setup.programs.premier; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Steam\*"; DestDir: "{app}\Setup\Steam"; Components: setup.programs.steam; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Torrent\*"; DestDir: "{app}\Setup\Torrent"; Components: setup.programs.torrent; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Windows and Microsoft Office (KMS Auto)\*"; DestDir: "{app}\Setup\Windows and Microsoft Office (KMS Auto)"; Components: setup.programs.windows_and_microsoft_office_kms_auto; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\WinRar\*"; DestDir: "{app}\Setup\WinRar"; Components: setup.programs.winrar; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Visual Studio (and Code version)\VS\*"; DestDir: "{app}\Setup\Visual Studio\VS"; Components: setup.programs.visualstudio; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Visual Studio (and Code version)\VS Code\*"; DestDir: "{app}\Setup\Visual Studio\VS Code"; Components: setup.programs.vscode; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Браузеры\ChromeSetup.exe"; DestDir: "{app}\Setup\Браузеры"; Components: setup.programs.browser.chrome; Flags: ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Браузеры\Firefox Installer.exe"; DestDir: "{app}\Setup\Браузеры"; Components: setup.programs.browser.firefox; Flags: ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Браузеры\MicrosoftEdgeSetup.exe"; DestDir: "{app}\Setup\Браузеры"; Components: setup.programs.browser.edge; Flags: ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Браузеры\OperaSetup.exe"; DestDir: "{app}\Setup\Браузеры"; Components: setup.programs.browser.opera; Flags: ignoreversion
Source: "E:\ДЛЯ ВСЕГО\MYSOFT\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Браузеры\Yandex.exe"; DestDir: "{app}\Setup\Браузеры"; Components: setup.programs.browser.yandex; Flags: ignoreversion

[Messages]
SetupWindowTitle=Установка - Софт
WelcomeLabel1=Добро пожаловать!
WelcomeLabel2=Перед вами мастер установки программной коллекции «Софт».%n%nВ сборник включены программы для работы, настройки компьютера и повседневных задач.%n%nВы сможете выбрать необходимые программы, архивы и отдельные файлы. Исходные файлы сохраняются без изменения.%n%nНажмите «Далее», чтобы продолжить.
SelectDirLabel3=Выберите папку, в которую будет установлена коллекция.%n%nПо умолчанию используется каталог Program Files. При необходимости вы можете выбрать другое расположение.%n%nДля продолжения нажмите «Далее».
ReadyLabel1=Подготовка завершена
ReadyLabel2=Все параметры установки настроены.%n%nПосле нажатия кнопки «Установить» начнётся копирование выбранных файлов.%n%nПроверьте выбранные параметры и нажмите «Установить».
InstallingLabel=Выполняется установка. Пожалуйста, дождитесь завершения процесса.
StatusExtractFiles=Копирование файлов: {0}
StatusCreateDirs=Создание каталогов: {0}
StatusRegisterFiles=Обработка файлов: {0}
FinishedHeadingLabel=Установка завершена
FinishedLabel=Программная коллекция «Софт» успешно установлена.%n%nВыбранные файлы размещены в указанном каталоге. Спасибо за использование коллекции!

[Code]
procedure InitializeWizard();
begin
  WizardForm.DiskSpaceLabel.Visible := False;
end;
