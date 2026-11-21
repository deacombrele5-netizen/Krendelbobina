; Полный сценарий установки коллекции «Софт» для Inno Setup.
; Основа — исходный Soft.iss. Исходные каталоги и файлы не изменяются.
#define MyAppName "Софт"
#define MyAppPublisher "MyCompany"
#define SourceRoot "E:\для всего\MySoft"
#define SourceCollection "{#SourceRoot}\Софт (исходники)"

[Setup]
AppId={{8D9C3E1A-4E2B-9F11-1234567890AB}
AppName={#MyAppName}
AppVerName=Софт
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\{#MyAppName}
DisableDirPage=no
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputDir={#SourceRoot}\Софт\Софт - установка
OutputBaseFilename=SoftSetup
Compression=lzma2/max
SolidCompression=yes
DiskSpanning=yes
DiskSliceSize=15000000000
WizardStyle=modern dark
WizardSizePercent=100
SetupIconFile={#SourceRoot}\app.ico
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
Name: "portable.programs.adobe.acrobat"; Description: "Adobe Acrobat Pro"; Types: full custom
Name: "portable.programs.adobe.aftereffects"; Description: "Adobe After Effects"; Types: full custom
Name: "portable.programs.adobe.audition"; Description: "Adobe Audition"; Types: full custom
Name: "portable.programs.adobe.illustrator"; Description: "Adobe Illustrator"; Types: full custom
Name: "portable.programs.adobe.photoshop"; Description: "Adobe Photoshop"; Types: full custom
Name: "portable.programs.adobe.premiere"; Description: "Adobe Premiere Pro"; Types: full custom
Name: "portable.programs.utilities"; Description: "Утилиты и системные программы"; Types: full custom
Name: "portable.programs.utilities.aida64"; Description: "AIDA64"; Types: full custom
Name: "portable.programs.utilities.anydesk"; Description: "AnyDesk"; Types: full custom
Name: "portable.programs.utilities.easy2boot"; Description: "Easy2Boot"; Types: full custom
Name: "portable.programs.utilities.encryptonclick"; Description: "EncryptOnClick"; Types: full custom
Name: "portable.programs.utilities.imgburn"; Description: "ImgBurn"; Types: full custom
Name: "portable.programs.utilities.microsoftscanner"; Description: "Microsoft Scanner"; Types: full custom
Name: "portable.programs.utilities.nsis"; Description: "NSIS"; Types: full custom
Name: "portable.programs.utilities.portablecreator"; Description: "Portable Creator"; Types: full custom
Name: "portable.programs.utilities.putty"; Description: "PuTTY"; Types: full custom
Name: "portable.programs.utilities.rufus"; Description: "Rufus"; Types: full custom
Name: "portable.programs.utilities.sysinternals"; Description: "Sysinternals Suite"; Types: full custom
Name: "portable.programs.utilities.wifiinfoview"; Description: "WifiInfoView"; Types: full custom
Name: "portable.programs.utilities.wnetwatcher"; Description: "WNetWatcher"; Types: full custom
Name: "portable.programs.utilities.winnotepad"; Description: "WinNotepad"; Types: full custom
Name: "portable.programs.utilities.winpowershell"; Description: "WinPowerShell"; Types: full custom
Name: "portable.programs.utilities.winrar"; Description: "WinRAR"; Types: full custom
Name: "portable.programs.utilities.winsetupfromusb"; Description: "WinSetupFromUSB"; Types: full custom
Name: "portable.programs.utilities.winterminal"; Description: "Windows Terminal"; Types: full custom
Name: "portable.programs.browsers"; Description: "Браузеры"; Types: full custom
Name: "portable.programs.browsers.chrome"; Description: "Google Chrome"; Types: full custom
Name: "portable.programs.office"; Description: "Офис"; Types: full custom
Name: "portable.programs.office.libreoffice"; Description: "LibreOffice"; Types: full custom
Name: "portable.programs.network"; Description: "Сеть и передача файлов"; Types: full custom
Name: "portable.programs.network.localsend"; Description: "LocalSend"; Types: full custom
Name: "portable.programs.network.winscp"; Description: "WinSCP"; Types: full custom
Name: "portable.programs.media"; Description: "Мультимедиа и графика"; Types: full custom
Name: "portable.programs.media.blender"; Description: "Blender"; Types: full custom
Name: "portable.programs.media.obs"; Description: "OBS Studio"; Types: full custom
Name: "portable.programs.media.vlc"; Description: "VLC Media Player"; Types: full custom
Name: "portable.programs.development"; Description: "Разработка"; Types: full custom
Name: "portable.programs.development.vscode"; Description: "Visual Studio Code"; Types: full custom
Name: "portable.programs.downloads"; Description: "Загрузки"; Types: full custom
Name: "portable.programs.downloads.utorrent"; Description: "µTorrent"; Types: full custom
Name: "setup"; Description: "Установочные программы, архивы и отдельные файлы"; Types: full custom
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
Name: "setup.programs.kms_auto"; Description: "Windows and Microsoft Office (KMS Auto)"; Types: full custom
Name: "setup.programs.winrar"; Description: "WinRar"; Types: full custom
Name: "setup.programs.visualstudio"; Description: "Visual Studio и Visual Studio Code"; Types: full custom
Name: "setup.programs.visualstudio.vs"; Description: "Visual Studio"; Types: full custom
Name: "setup.programs.visualstudio.vscode"; Description: "Visual Studio Code"; Types: full custom
Name: "setup.programs.browsers"; Description: "Отдельные установщики браузеров"; Types: full custom
Name: "setup.programs.browsers.chrome"; Description: "Google Chrome"; Types: full custom
Name: "setup.programs.browsers.firefox"; Description: "Mozilla Firefox"; Types: full custom
Name: "setup.programs.browsers.edge"; Description: "Microsoft Edge"; Types: full custom
Name: "setup.programs.browsers.opera"; Description: "Opera"; Types: full custom
Name: "setup.programs.browsers.yandex"; Description: "Яндекс Браузер"; Types: full custom
Name: "setup.readme"; Description: "Документы ReadMe"; Types: full custom

[Files]
; Документы ReadMe.
Source: "{#SourceRoot}\Софт\ReadMe (Software Installation Guide).docx"; DestDir: "{app}\Документы"; Components: setup.readme; Flags: ignoreversion
Source: "{#SourceRoot}\Софт\ReadMe (Software Installation Guide).txt"; DestDir: "{app}\Документы"; Components: setup.readme; Flags: ignoreversion

; Архивы копируются как есть, без распаковки.
Source: "{#SourceCollection}\Софт-Portable\Софт-Portable.rar"; DestDir: "{app}\Архивы"; Components: portable.archive; Flags: ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Информация об архиве - Софт-Portable.txt"; DestDir: "{app}\Архивы"; Components: portable.info; Flags: ignoreversion
Source: "{#SourceCollection}\Софт-SetUp\Софт-SetUp.rar"; DestDir: "{app}\Архивы"; Components: setup.archive; Flags: ignoreversion
Source: "{#SourceCollection}\Софт-SetUp\Информация об архиве - Софт-SetUp.txt"; DestDir: "{app}\Архивы"; Components: setup.info; Flags: ignoreversion

; 33 каталога Portable: все вложенные файлы и папки.
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\AdobeAcrobatPro-Portable\*"; DestDir: "{app}\Portable\AdobeAcrobatPro-Portable"; Components: portable.programs.adobe.acrobat; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\AdobeAfterEffects-Portable\*"; DestDir: "{app}\Portable\AdobeAfterEffects-Portable"; Components: portable.programs.adobe.aftereffects; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\AdobeAudition-Portable\*"; DestDir: "{app}\Portable\AdobeAudition-Portable"; Components: portable.programs.adobe.audition; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\AdobeIllustrator-Portable\*"; DestDir: "{app}\Portable\AdobeIllustrator-Portable"; Components: portable.programs.adobe.illustrator; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\AdobePhotoshop-Portable\*"; DestDir: "{app}\Portable\AdobePhotoshop-Portable"; Components: portable.programs.adobe.photoshop; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\AdobePremierePro-Portable\*"; DestDir: "{app}\Portable\AdobePremierePro-Portable"; Components: portable.programs.adobe.premiere; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\AIDA64-Portable\*"; DestDir: "{app}\Portable\AIDA64-Portable"; Components: portable.programs.utilities.aida64; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\AnyDesk-Portable\*"; DestDir: "{app}\Portable\AnyDesk-Portable"; Components: portable.programs.utilities.anydesk; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\Easy2Boot-Portable\*"; DestDir: "{app}\Portable\Easy2Boot-Portable"; Components: portable.programs.utilities.easy2boot; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\EncryptOnClick-Portable\*"; DestDir: "{app}\Portable\EncryptOnClick-Portable"; Components: portable.programs.utilities.encryptonclick; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\ImgBurn-Portable\*"; DestDir: "{app}\Portable\ImgBurn-Portable"; Components: portable.programs.utilities.imgburn; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\MicrosoftScaner-Portable\*"; DestDir: "{app}\Portable\MicrosoftScaner-Portable"; Components: portable.programs.utilities.microsoftscanner; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\NSIS-Portable\*"; DestDir: "{app}\Portable\NSIS-Portable"; Components: portable.programs.utilities.nsis; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\PortableCreator-Portable\*"; DestDir: "{app}\Portable\PortableCreator-Portable"; Components: portable.programs.utilities.portablecreator; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\PuTTY-Portable\*"; DestDir: "{app}\Portable\PuTTY-Portable"; Components: portable.programs.utilities.putty; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\Rufus-Portable\*"; DestDir: "{app}\Portable\Rufus-Portable"; Components: portable.programs.utilities.rufus; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\SysinternalsSuite-Portable\*"; DestDir: "{app}\Portable\SysinternalsSuite-Portable"; Components: portable.programs.utilities.sysinternals; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\Wifiinfoview-Portable\*"; DestDir: "{app}\Portable\Wifiinfoview-Portable"; Components: portable.programs.utilities.wifiinfoview; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\Wnet-Watcher-Portable\*"; DestDir: "{app}\Portable\Wnet-Watcher-Portable"; Components: portable.programs.utilities.wnetwatcher; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\WinNotepad-Portable\*"; DestDir: "{app}\Portable\WinNotepad-Portable"; Components: portable.programs.utilities.winnotepad; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\WinPowerShel-Portable\*"; DestDir: "{app}\Portable\WinPowerShel-Portable"; Components: portable.programs.utilities.winpowershell; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\WinRAR-Portable\*"; DestDir: "{app}\Portable\WinRAR-Portable"; Components: portable.programs.utilities.winrar; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\WinSetupFromUSB-Portable\*"; DestDir: "{app}\Portable\WinSetupFromUSB-Portable"; Components: portable.programs.utilities.winsetupfromusb; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\WinTerminal-Portable\*"; DestDir: "{app}\Portable\WinTerminal-Portable"; Components: portable.programs.utilities.winterminal; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\GoogleChrome-Portable\*"; DestDir: "{app}\Portable\GoogleChrome-Portable"; Components: portable.programs.browsers.chrome; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\LibreOffice-Portable\*"; DestDir: "{app}\Portable\LibreOffice-Portable"; Components: portable.programs.office.libreoffice; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\LocalSend-Portable\*"; DestDir: "{app}\Portable\LocalSend-Portable"; Components: portable.programs.network.localsend; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\WinSCP-Portable\*"; DestDir: "{app}\Portable\WinSCP-Portable"; Components: portable.programs.network.winscp; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\Blender-Portable\*"; DestDir: "{app}\Portable\Blender-Portable"; Components: portable.programs.media.blender; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\OBS-Studio-Portable\*"; DestDir: "{app}\Portable\OBS-Studio-Portable"; Components: portable.programs.media.obs; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\VlcMediaPlayer-Portable\*"; DestDir: "{app}\Portable\VlcMediaPlayer-Portable"; Components: portable.programs.media.vlc; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\VSCode-Portable\*"; DestDir: "{app}\Portable\VSCode-Portable"; Components: portable.programs.development.vscode; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-Portable\Программы без архива-Portable\uTorrent-Portable\*"; DestDir: "{app}\Portable\uTorrent-Portable"; Components: portable.programs.downloads.utorrent; Flags: recursesubdirs createallsubdirs ignoreversion

; Все категории Setup копируются целиком, со всем вложенным содержимым.
Source: "{#SourceCollection}\Софт-SetUp\Программы без архива-SetUp\Adobe Acrobat Pro\*"; DestDir: "{app}\Setup\Adobe Acrobat Pro"; Components: setup.programs.adobe_acrobat_pro; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-SetUp\Программы без архива-SetUp\Adobe After Effects\*"; DestDir: "{app}\Setup\Adobe After Effects"; Components: setup.programs.adobe_after_effects; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-SetUp\Программы без архива-SetUp\Adobe Animate\*"; DestDir: "{app}\Setup\Adobe Animate"; Components: setup.programs.adobe_animate; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-SetUp\Программы без архива-SetUp\Adobe Audition\*"; DestDir: "{app}\Setup\Adobe Audition"; Components: setup.programs.adobe_audition; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-SetUp\Программы без архива-SetUp\Adobe Lightroom Classic\*"; DestDir: "{app}\Setup\Adobe Lightroom Classic"; Components: setup.programs.adobe_lightroom_classic; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-SetUp\Программы без архива-SetUp\Adobe Substance 3D Painter\*"; DestDir: "{app}\Setup\Adobe Substance 3D Painter"; Components: setup.programs.adobe_substance_3d_painter; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-SetUp\Программы без архива-SetUp\AIDA 64\*"; DestDir: "{app}\Setup\AIDA 64"; Components: setup.programs.aida_64; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-SetUp\Программы без архива-SetUp\Blender 3D\*"; DestDir: "{app}\Setup\Blender 3D"; Components: setup.programs.blender_3d; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-SetUp\Программы без архива-SetUp\Discord\*"; DestDir: "{app}\Setup\Discord"; Components: setup.programs.discord; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-SetUp\Программы без архива-SetUp\Epic Games\*"; DestDir: "{app}\Setup\Epic Games"; Components: setup.programs.epic_games; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-SetUp\Программы без архива-SetUp\FL Studio\*"; DestDir: "{app}\Setup\FL Studio"; Components: setup.programs.fl_studio; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-SetUp\Программы без архива-SetUp\Illustrator\*"; DestDir: "{app}\Setup\Illustrator"; Components: setup.programs.illustrator; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-SetUp\Программы без архива-SetUp\InDesign\*"; DestDir: "{app}\Setup\InDesign"; Components: setup.programs.indesign; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-SetUp\Программы без архива-SetUp\LocalSend\*"; DestDir: "{app}\Setup\LocalSend"; Components: setup.programs.localsend; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-SetUp\Программы без архива-SetUp\Microsoft Office\*"; DestDir: "{app}\Setup\Microsoft Office"; Components: setup.programs.microsoft_office; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-SetUp\Программы без архива-SetUp\OBS Studio\*"; DestDir: "{app}\Setup\OBS Studio"; Components: setup.programs.obs_studio; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-SetUp\Программы без архива-SetUp\Photoshop\*"; DestDir: "{app}\Setup\Photoshop"; Components: setup.programs.photoshop; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-SetUp\Программы без архива-SetUp\Premier\*"; DestDir: "{app}\Setup\Premier"; Components: setup.programs.premier; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-SetUp\Программы без архива-SetUp\Steam\*"; DestDir: "{app}\Setup\Steam"; Components: setup.programs.steam; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-SetUp\Программы без архива-SetUp\Torrent\*"; DestDir: "{app}\Setup\Torrent"; Components: setup.programs.torrent; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-SetUp\Программы без архива-SetUp\Windows and Microsoft Office (KMS Auto)\*"; DestDir: "{app}\Setup\Windows and Microsoft Office (KMS Auto)"; Components: setup.programs.kms_auto; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-SetUp\Программы без архива-SetUp\WinRar\*"; DestDir: "{app}\Setup\WinRar"; Components: setup.programs.winrar; Flags: recursesubdirs createallsubdirs ignoreversion
; Visual Studio и VS Code — отдельные пункты выбора.
Source: "{#SourceCollection}\Софт-SetUp\Программы без архива-SetUp\Visual Studio (and Code version)\VS\*"; DestDir: "{app}\Setup\Visual Studio\VS"; Components: setup.programs.visualstudio.vs; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#SourceCollection}\Софт-SetUp\Программы без архива-SetUp\Visual Studio (and Code version)\VS Code\*"; DestDir: "{app}\Setup\Visual Studio\VS Code"; Components: setup.programs.visualstudio.vscode; Flags: recursesubdirs createallsubdirs ignoreversion
; Самостоятельные установщики браузеров — каждый отдельно.
Source: "{#SourceCollection}\Софт-SetUp\Программы без архива-SetUp\Браузеры\ChromeSetup.exe"; DestDir: "{app}\Setup\Браузеры"; Components: setup.programs.browsers.chrome; Flags: ignoreversion
Source: "{#SourceCollection}\Софт-SetUp\Программы без архива-SetUp\Браузеры\Firefox Installer.exe"; DestDir: "{app}\Setup\Браузеры"; Components: setup.programs.browsers.firefox; Flags: ignoreversion
Source: "{#SourceCollection}\Софт-SetUp\Программы без архива-SetUp\Браузеры\MicrosoftEdgeSetup.exe"; DestDir: "{app}\Setup\Браузеры"; Components: setup.programs.browsers.edge; Flags: ignoreversion
Source: "{#SourceCollection}\Софт-SetUp\Программы без архива-SetUp\Браузеры\OperaSetup.exe"; DestDir: "{app}\Setup\Браузеры"; Components: setup.programs.browsers.opera; Flags: ignoreversion
Source: "{#SourceCollection}\Софт-SetUp\Программы без архива-SetUp\Браузеры\Yandex.exe"; DestDir: "{app}\Setup\Браузеры"; Components: setup.programs.browsers.yandex; Flags: ignoreversion

[Messages]
SetupWindowTitle=Установка - Софт
WelcomeLabel1=Добро пожаловать!
WelcomeLabel2=Перед вами мастер установки программной коллекции «Софт».%n%nВ сборник включены программы для работы, настройки компьютера и повседневных задач.%n%nВы сможете выбрать программы из каталога, архивы или отдельные установочные файлы.%n%nНажмите «Далее», чтобы продолжить.
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
var
  ContentModePage: TInputOptionWizardPage;

procedure InitializeWizard();
begin
  WizardForm.DiskSpaceLabel.Visible := False;
  ContentModePage := CreateInputOptionPage(wpSelectDir, 'Выбор содержимого',
    'Что вы хотите выбрать?',
    'Выберите режим, после чего на следующем шаге отметьте нужные пункты:',
    True, False);
  ContentModePage.Add('Выбрать программу из каталога программ');
  ContentModePage.Add('Выбрать архив или отдельный файл');
  ContentModePage.SelectedValueIndex := 0;
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := True;
  if CurPageID = ContentModePage.ID then
  begin
    if ContentModePage.SelectedValueIndex = 0 then
    begin
      WizardSelectComponents('!*portable.programs,!*setup.programs,!portable.archive,!portable.info,!setup.archive,!setup.info,!setup.readme,*portable.programs,*setup.programs');
    end
    else
    begin
      WizardSelectComponents('!*portable.programs,!*setup.programs,!portable.archive,!portable.info,!setup.archive,!setup.info,!setup.readme,portable.archive,portable.info,setup.archive,setup.info,*setup.programs.browsers,setup.readme');
    end;
  end;
end;
