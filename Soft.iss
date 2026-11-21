; Полный сценарий установки коллекции «Софт» для Inno Setup 6.x.
; ИНСТРУКЦИЯ:
; 1. Разместите исходную коллекцию в E:\для всего\MySoft (или измените SourceRoot ниже).
; 2. В корне MySoft должны находиться app.ico, папка «Софт», папка «Софт (исходники)» и этот ISS.
; 3. Откройте Soft.iss в Inno Setup Compiler и нажмите Compile.
; 4. На первом шаге выберите режим: программы из каталога Portable/Setup либо архивы и отдельные файлы.
; 5. На следующем шаге отметьте нужные папки или файлы; для выбранных папок копируется всё содержимое рекурсивно.
; Сценарий сохраняет исходные имена, вложенные каталоги и структуру выбранных программ.
; Файлы не переименовываются, не подменяются и не исключаются фильтрами Excludes.
; Включены все найденные каталоги Portable и Setup, в том числе «Windows and Microsoft Office (KMS Auto)».
; Отдельные ISO/EXE/MSI/MD5/SFV/SHA, архивы и ReadMe выбираются на вкладке отдельных файлов.
; ВНИМАНИЕ: исходный путь должен существовать на компьютере, где выполняется компиляция.
#define MyAppName "Софт"
#define MyAppPublisher "MyCompany"
#define SourceRoot "E:\для всего\MySoft"

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
UninstallDisplayIcon={app}\app.ico
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

[Files]
; Иконка приложения и деинсталлятора — сохраняем поведение исходного сценария.
Source: "{#SourceRoot}\app.ico"; DestDir: "{app}"; Flags: ignoreversion
; Все записи ниже проверяются по выбранным пользователем пунктам.
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\AdobeAcrobatPro-Portable\*"; DestDir: "{app}\Portable\AdobeAcrobatPro-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0001')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\AdobeAfterEffects-Portable\*"; DestDir: "{app}\Portable\AdobeAfterEffects-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0002')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\AdobeAudition-Portable\*"; DestDir: "{app}\Portable\AdobeAudition-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0003')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\AdobeIllustrator-Portable\*"; DestDir: "{app}\Portable\AdobeIllustrator-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0004')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\AdobePhotoshop-Portable\*"; DestDir: "{app}\Portable\AdobePhotoshop-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0005')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\AdobePremierePro-Portable\*"; DestDir: "{app}\Portable\AdobePremierePro-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0006')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\AIDA64-Portable\*"; DestDir: "{app}\Portable\AIDA64-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0007')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\AnyDesk-Portable\*"; DestDir: "{app}\Portable\AnyDesk-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0008')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\Easy2Boot-Portable\*"; DestDir: "{app}\Portable\Easy2Boot-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0009')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\EncryptOnClick-Portable\*"; DestDir: "{app}\Portable\EncryptOnClick-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0010')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\ImgBurn-Portable\*"; DestDir: "{app}\Portable\ImgBurn-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0011')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\MicrosoftScaner-Portable\*"; DestDir: "{app}\Portable\MicrosoftScaner-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0012')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\NSIS-Portable\*"; DestDir: "{app}\Portable\NSIS-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0013')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\PortableCreator-Portable\*"; DestDir: "{app}\Portable\PortableCreator-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0014')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\PuTTY-Portable\*"; DestDir: "{app}\Portable\PuTTY-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0015')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\Rufus-Portable\*"; DestDir: "{app}\Portable\Rufus-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0016')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\SysinternalsSuite-Portable\*"; DestDir: "{app}\Portable\SysinternalsSuite-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0017')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\Wifiinfoview-Portable\*"; DestDir: "{app}\Portable\Wifiinfoview-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0018')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\WinNotepad-Portable\*"; DestDir: "{app}\Portable\WinNotepad-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0019')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\WinPowerShel-Portable\*"; DestDir: "{app}\Portable\WinPowerShel-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0020')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\WinRAR-Portable\*"; DestDir: "{app}\Portable\WinRAR-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0021')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\WinSetupFromUSB-Portable\*"; DestDir: "{app}\Portable\WinSetupFromUSB-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0022')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\WinTerminal-Portable\*"; DestDir: "{app}\Portable\WinTerminal-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0023')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\Wnet-Watcher-Portable\*"; DestDir: "{app}\Portable\Wnet-Watcher-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0024')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\GoogleChrome-Portable\*"; DestDir: "{app}\Portable\GoogleChrome-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0025')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\LibreOffice-Portable\*"; DestDir: "{app}\Portable\LibreOffice-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0026')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\LocalSend-Portable\*"; DestDir: "{app}\Portable\LocalSend-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0027')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\WinSCP-Portable\*"; DestDir: "{app}\Portable\WinSCP-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0028')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\Blender-Portable\*"; DestDir: "{app}\Portable\Blender-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0029')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\OBS-Studio-Portable\*"; DestDir: "{app}\Portable\OBS-Studio-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0030')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\VlcMediaPlayer-Portable\*"; DestDir: "{app}\Portable\VlcMediaPlayer-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0031')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\VSCode-Portable\*"; DestDir: "{app}\Portable\VSCode-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0032')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Программы без архива-Portable\uTorrent-Portable\*"; DestDir: "{app}\Portable\uTorrent-Portable"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('p0033')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Adobe Acrobat Pro\*"; DestDir: "{app}\Setup\Adobe Acrobat Pro"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('s0034')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Adobe After Effects\*"; DestDir: "{app}\Setup\Adobe After Effects"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('s0035')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Adobe Animate\*"; DestDir: "{app}\Setup\Adobe Animate"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('s0036')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Adobe Audition\*"; DestDir: "{app}\Setup\Adobe Audition"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('s0037')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Adobe Lightroom Classic\*"; DestDir: "{app}\Setup\Adobe Lightroom Classic"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('s0038')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Adobe Substance 3D Painter\*"; DestDir: "{app}\Setup\Adobe Substance 3D Painter"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('s0039')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Illustrator\*"; DestDir: "{app}\Setup\Illustrator"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('s0040')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\InDesign\*"; DestDir: "{app}\Setup\InDesign"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('s0041')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Photoshop\*"; DestDir: "{app}\Setup\Photoshop"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('s0042')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Premier\*"; DestDir: "{app}\Setup\Premier"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('s0043')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\AIDA 64\*"; DestDir: "{app}\Setup\AIDA 64"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('s0044')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\WinRar\*"; DestDir: "{app}\Setup\WinRar"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('s0045')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Blender 3D\*"; DestDir: "{app}\Setup\Blender 3D"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('s0046')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Discord\*"; DestDir: "{app}\Setup\Discord"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('s0047')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Epic Games\*"; DestDir: "{app}\Setup\Epic Games"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('s0048')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\FL Studio\*"; DestDir: "{app}\Setup\FL Studio"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('s0049')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\LocalSend\*"; DestDir: "{app}\Setup\LocalSend"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('s0050')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Microsoft Office\*"; DestDir: "{app}\Setup\Microsoft Office"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('s0051')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\OBS Studio\*"; DestDir: "{app}\Setup\OBS Studio"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('s0052')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Steam\*"; DestDir: "{app}\Setup\Steam"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('s0053')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Torrent\*"; DestDir: "{app}\Setup\Torrent"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('s0054')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Visual Studio (and Code version)\VS\*"; DestDir: "{app}\Setup\Visual Studio\VS"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('s0055')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Visual Studio (and Code version)\VS Code\*"; DestDir: "{app}\Setup\Visual Studio\VS Code"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('s0056')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Windows and Microsoft Office (KMS Auto)\*"; DestDir: "{app}\Setup\Windows and Microsoft Office (KMS Auto)"; Flags: recursesubdirs createallsubdirs ignoreversion; Check: IsChosen('s0057')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Софт-Portable.rar"; DestDir: "{app}\Архивы"; Flags: ignoreversion; Check: IsChosen('f0057')
Source: "{#SourceRoot}\Софт (исходники)\Софт-Portable\Информация об архиве - Софт-Portable.txt"; DestDir: "{app}\Архивы"; Flags: ignoreversion; Check: IsChosen('f0058')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Софт-SetUp.rar"; DestDir: "{app}\Архивы"; Flags: ignoreversion; Check: IsChosen('f0059')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Информация об архиве - Софт-SetUp.txt"; DestDir: "{app}\Архивы"; Flags: ignoreversion; Check: IsChosen('f0060')
Source: "{#SourceRoot}\Софт\ReadMe (Software Installation Guide).docx"; DestDir: "{app}\Документы"; Flags: ignoreversion; Check: IsChosen('f0061')
Source: "{#SourceRoot}\Софт\ReadMe (Software Installation Guide).txt"; DestDir: "{app}\Документы"; Flags: ignoreversion; Check: IsChosen('f0062')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Adobe Acrobat Pro\Adobe.Acrobat.Pro.2025.u25.x64.Multilingual.iso"; DestDir: "{app}\Setup\Adobe Acrobat Pro"; Flags: ignoreversion; Check: IsChosen('f0063')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Adobe Acrobat Pro\Adobe.Acrobat.Pro.2025.u25.x64.Multilingual.md5"; DestDir: "{app}\Setup\Adobe Acrobat Pro"; Flags: ignoreversion; Check: IsChosen('f0064')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Adobe Acrobat Pro\Adobe.Acrobat.Pro.2025.u25.x64.Multilingual.sfv"; DestDir: "{app}\Setup\Adobe Acrobat Pro"; Flags: ignoreversion; Check: IsChosen('f0065')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Adobe Acrobat Pro\Adobe.Acrobat.Pro.2025.u25.x64.Multilingual.sha"; DestDir: "{app}\Setup\Adobe Acrobat Pro"; Flags: ignoreversion; Check: IsChosen('f0066')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Adobe After Effects\Adobe After Effects 2024 24.6.2.002.iso"; DestDir: "{app}\Setup\Adobe After Effects"; Flags: ignoreversion; Check: IsChosen('f0067')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Adobe Animate\Adobe Animate 2022 v22.0.4.185 x64 Multilingual.iso"; DestDir: "{app}\Setup\Adobe Animate"; Flags: ignoreversion; Check: IsChosen('f0068')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Adobe Lightroom Classic\AUTORUN.exe"; DestDir: "{app}\Setup\Adobe Lightroom Classic"; Flags: ignoreversion; Check: IsChosen('f0069')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Adobe Lightroom Classic\AUTORUN.inf"; DestDir: "{app}\Setup\Adobe Lightroom Classic"; Flags: ignoreversion; Check: IsChosen('f0070')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\AIDA 64\aida64extreme520_3400.exe"; DestDir: "{app}\Setup\AIDA 64"; Flags: ignoreversion; Check: IsChosen('f0071')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Blender 3D\blender-5.2.3-windows-x64.msi"; DestDir: "{app}\Setup\Blender 3D"; Flags: ignoreversion; Check: IsChosen('f0072')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Discord\DiscordSetup.exe"; DestDir: "{app}\Setup\Discord"; Flags: ignoreversion; Check: IsChosen('f0073')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Epic Games\EpicInstaller-20.3.3.msi"; DestDir: "{app}\Setup\Epic Games"; Flags: ignoreversion; Check: IsChosen('f0074')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\FL Studio\flstudio_win64_26.1.7.5654.exe"; DestDir: "{app}\Setup\FL Studio"; Flags: ignoreversion; Check: IsChosen('f0075')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Illustrator\Adobe.Illustrator.2024.Multilingual.iso"; DestDir: "{app}\Setup\Illustrator"; Flags: ignoreversion; Check: IsChosen('f0076')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Illustrator\Adobe.Illustrator.2024.Multilingual.md5"; DestDir: "{app}\Setup\Illustrator"; Flags: ignoreversion; Check: IsChosen('f0077')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Illustrator\Adobe.Illustrator.2024.Multilingual.sfv"; DestDir: "{app}\Setup\Illustrator"; Flags: ignoreversion; Check: IsChosen('f0078')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Illustrator\Adobe.Illustrator.2024.Multilingual.sha"; DestDir: "{app}\Setup\Illustrator"; Flags: ignoreversion; Check: IsChosen('f0079')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\InDesign\Adobe.InDesign.2025.u6.Multilingual.iso"; DestDir: "{app}\Setup\InDesign"; Flags: ignoreversion; Check: IsChosen('f0080')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\InDesign\Adobe.InDesign.2025.u6.Multilingual.iso.md5"; DestDir: "{app}\Setup\InDesign"; Flags: ignoreversion; Check: IsChosen('f0081')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\InDesign\Adobe.InDesign.2025.u6.Multilingual.iso.sfv"; DestDir: "{app}\Setup\InDesign"; Flags: ignoreversion; Check: IsChosen('f0082')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\InDesign\Adobe.InDesign.2025.u6.Multilingual.iso.sha"; DestDir: "{app}\Setup\InDesign"; Flags: ignoreversion; Check: IsChosen('f0083')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\LocalSend\LocalSend-1.18.2-windows-x86-64.exe"; DestDir: "{app}\Setup\LocalSend"; Flags: ignoreversion; Check: IsChosen('f0084')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Microsoft Office\OfficeSetup.exe"; DestDir: "{app}\Setup\Microsoft Office"; Flags: ignoreversion; Check: IsChosen('f0085')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Microsoft Office\Не устанавливается.txt"; DestDir: "{app}\Setup\Microsoft Office"; Flags: ignoreversion; Check: IsChosen('f0086')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\OBS Studio\OBS-Studio-33.0.1-Windows-x64-Installer.exe"; DestDir: "{app}\Setup\OBS Studio"; Flags: ignoreversion; Check: IsChosen('f0087')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Premier\autoplay.exe"; DestDir: "{app}\Setup\Premier"; Flags: ignoreversion; Check: IsChosen('f0088')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Premier\autorun.inf"; DestDir: "{app}\Setup\Premier"; Flags: ignoreversion; Check: IsChosen('f0089')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Steam\SteamSetup.exe"; DestDir: "{app}\Setup\Steam"; Flags: ignoreversion; Check: IsChosen('f0090')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Torrent\utorrent_installer.exe"; DestDir: "{app}\Setup\Torrent"; Flags: ignoreversion; Check: IsChosen('f0091')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\WinRar\winrar-x64-723ru.exe"; DestDir: "{app}\Setup\WinRar"; Flags: ignoreversion; Check: IsChosen('f0092')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Браузеры\ChromeSetup.exe"; DestDir: "{app}\Setup\Браузеры"; Flags: ignoreversion; Check: IsChosen('f0093')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Браузеры\Firefox Installer.exe"; DestDir: "{app}\Setup\Браузеры"; Flags: ignoreversion; Check: IsChosen('f0094')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Браузеры\MicrosoftEdgeSetup.exe"; DestDir: "{app}\Setup\Браузеры"; Flags: ignoreversion; Check: IsChosen('f0095')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Браузеры\OperaSetup.exe"; DestDir: "{app}\Setup\Браузеры"; Flags: ignoreversion; Check: IsChosen('f0096')
Source: "{#SourceRoot}\Софт (исходники)\Софт-SetUp\Программы без архива-SetUp\Браузеры\Yandex.exe"; DestDir: "{app}\Setup\Браузеры"; Flags: ignoreversion; Check: IsChosen('f0097')

[Messages]
SetupWindowTitle=Установка - Софт
WelcomeLabel1=Добро пожаловать!
WelcomeLabel2=Перед вами мастер установки программной коллекции «Софт».%n%nВ сборник включены программы для работы, настройки компьютера и повседневных задач.%n%nМастер поможет выбрать программы из каталога Portable и Setup либо скопировать архивы, документы и отдельные файлы.%n%nНажмите «Далее», чтобы продолжить.
SelectDirLabel3=Выберите папку, в которую будет установлена коллекция.%n%nПо умолчанию используется каталог Program Files. При необходимости вы можете выбрать другое расположение.%n%nДля продолжения нажмите «Далее».
ReadyLabel1=Подготовка завершена
ReadyLabel2=Все параметры установки настроены.%n%nПосле нажатия кнопки «Установить» начнётся копирование выбранных файлов.%n%nПродолжительность процесса зависит от скорости накопителя и производительности компьютера.%n%nПроверьте выбранные параметры и нажмите «Установить».
InstallingLabel=Выполняется установка. Пожалуйста, дождитесь завершения процесса.
StatusExtractFiles=Копирование файлов: {0}
StatusCreateDirs=Создание каталогов: {0}
StatusRegisterFiles=Обработка файлов: {0}
FinishedHeadingLabel=Установка завершена
FinishedLabel=Программная коллекция «Софт» успешно установлена.%n%nВыбранные файлы размещены в указанном каталоге. Спасибо за использование коллекции!

[Code]
var
  ModePage: TInputOptionWizardPage;
  SelectionPage: TWizardPage;
  CatalogList: TNewCheckListBox;
  FilesList: TNewCheckListBox;
  CatalogIDs: TStringList;
  FileIDs: TStringList;
  SelectedItems: TStringList;
  I: Integer;

procedure AddCatalogItem(const Caption, ItemID: String; const Level: Byte; const HasChildren: Boolean);
begin
  CatalogList.AddCheckBox(Caption, '', Level, False, True, HasChildren, True, nil);
  CatalogIDs.Add(ItemID);
end;

procedure AddFileItem(const Caption, ItemID: String; const Level: Byte; const HasChildren: Boolean);
begin
  FilesList.AddCheckBox(Caption, '', Level, False, True, HasChildren, True, nil);
  FileIDs.Add(ItemID);
end;

function IsChosen(const ItemID: String): Boolean;
begin
  Result := SelectedItems.IndexOf(ItemID) >= 0;
end;

procedure InitializeWizard();
begin
  WizardForm.DiskSpaceLabel.Visible := False;

  ModePage := CreateInputOptionPage(wpWelcome, 'Выбор содержимого',
    'Что вы хотите выбрать?',
    'Сначала выберите один из двух режимов. На следующем шаге появится соответствующий список:', True, False);
  ModePage.Add('Выбрать программу из каталога программ');
  ModePage.Add('Выбрать архив или отдельный файл');
  ModePage.SelectedValueIndex := 0;

  SelectionPage := CreateCustomPage(ModePage.ID, 'Состав установки',
    'Отметьте только те программы или файлы, которые нужно скопировать. Изначально ничего не выбрано.');

  CatalogIDs := TStringList.Create;
  FileIDs := TStringList.Create;
  SelectedItems := TStringList.Create;

  CatalogList := TNewCheckListBox.Create(SelectionPage);
  CatalogList.Left := 0;
  CatalogList.Top := 0;
  CatalogList.Width := SelectionPage.SurfaceWidth;
  CatalogList.Height := SelectionPage.SurfaceHeight;
  CatalogList.Anchors := [akLeft, akTop, akRight, akBottom];
  CatalogList.Flat := True;
  CatalogList.Parent := SelectionPage.Surface;

  FilesList := TNewCheckListBox.Create(SelectionPage);
  FilesList.Left := 0;
  FilesList.Top := 0;
  FilesList.Width := SelectionPage.SurfaceWidth;
  FilesList.Height := SelectionPage.SurfaceHeight;
  FilesList.Anchors := [akLeft, akTop, akRight, akBottom];
  FilesList.Flat := True;
  FilesList.Parent := SelectionPage.Surface;
  FilesList.Visible := False;

  AddCatalogItem('Каталог Portable', '', 0, True);
  AddCatalogItem('Adobe', '', 1, True);
  AddCatalogItem('AdobeAcrobatPro-Portable', 'p0001', 2, False);
  AddCatalogItem('AdobeAfterEffects-Portable', 'p0002', 2, False);
  AddCatalogItem('AdobeAudition-Portable', 'p0003', 2, False);
  AddCatalogItem('AdobeIllustrator-Portable', 'p0004', 2, False);
  AddCatalogItem('AdobePhotoshop-Portable', 'p0005', 2, False);
  AddCatalogItem('AdobePremierePro-Portable', 'p0006', 2, False);
  AddCatalogItem('Утилиты и системные программы', '', 1, True);
  AddCatalogItem('AIDA64-Portable', 'p0007', 2, False);
  AddCatalogItem('AnyDesk-Portable', 'p0008', 2, False);
  AddCatalogItem('Easy2Boot-Portable', 'p0009', 2, False);
  AddCatalogItem('EncryptOnClick-Portable', 'p0010', 2, False);
  AddCatalogItem('ImgBurn-Portable', 'p0011', 2, False);
  AddCatalogItem('MicrosoftScaner-Portable', 'p0012', 2, False);
  AddCatalogItem('NSIS-Portable', 'p0013', 2, False);
  AddCatalogItem('PortableCreator-Portable', 'p0014', 2, False);
  AddCatalogItem('PuTTY-Portable', 'p0015', 2, False);
  AddCatalogItem('Rufus-Portable', 'p0016', 2, False);
  AddCatalogItem('SysinternalsSuite-Portable', 'p0017', 2, False);
  AddCatalogItem('Wifiinfoview-Portable', 'p0018', 2, False);
  AddCatalogItem('WinNotepad-Portable', 'p0019', 2, False);
  AddCatalogItem('WinPowerShel-Portable', 'p0020', 2, False);
  AddCatalogItem('WinRAR-Portable', 'p0021', 2, False);
  AddCatalogItem('WinSetupFromUSB-Portable', 'p0022', 2, False);
  AddCatalogItem('WinTerminal-Portable', 'p0023', 2, False);
  AddCatalogItem('Wnet-Watcher-Portable', 'p0024', 2, False);
  AddCatalogItem('Браузеры', '', 1, True);
  AddCatalogItem('GoogleChrome-Portable', 'p0025', 2, False);
  AddCatalogItem('Офис', '', 1, True);
  AddCatalogItem('LibreOffice-Portable', 'p0026', 2, False);
  AddCatalogItem('Сеть и передача файлов', '', 1, True);
  AddCatalogItem('LocalSend-Portable', 'p0027', 2, False);
  AddCatalogItem('WinSCP-Portable', 'p0028', 2, False);
  AddCatalogItem('Мультимедиа и графика', '', 1, True);
  AddCatalogItem('Blender-Portable', 'p0029', 2, False);
  AddCatalogItem('OBS-Studio-Portable', 'p0030', 2, False);
  AddCatalogItem('VlcMediaPlayer-Portable', 'p0031', 2, False);
  AddCatalogItem('Разработка', '', 1, True);
  AddCatalogItem('VSCode-Portable', 'p0032', 2, False);
  AddCatalogItem('Загрузки', '', 1, True);
  AddCatalogItem('uTorrent-Portable', 'p0033', 2, False);
  AddCatalogItem('Каталог Setup', '', 0, True);
  AddCatalogItem('Графика и мультимедиа', '', 1, True);
  AddCatalogItem('Adobe Acrobat Pro', 's0034', 2, False);
  AddCatalogItem('Adobe After Effects', 's0035', 2, False);
  AddCatalogItem('Adobe Animate', 's0036', 2, False);
  AddCatalogItem('Adobe Audition', 's0037', 2, False);
  AddCatalogItem('Adobe Lightroom Classic', 's0038', 2, False);
  AddCatalogItem('Adobe Substance 3D Painter', 's0039', 2, False);
  AddCatalogItem('Illustrator', 's0040', 2, False);
  AddCatalogItem('InDesign', 's0041', 2, False);
  AddCatalogItem('Photoshop', 's0042', 2, False);
  AddCatalogItem('Premier', 's0043', 2, False);
  AddCatalogItem('Системные программы', '', 1, True);
  AddCatalogItem('AIDA 64', 's0044', 2, False);
  AddCatalogItem('WinRar', 's0045', 2, False);
  AddCatalogItem('Программы и сервисы', '', 1, True);
  AddCatalogItem('Blender 3D', 's0046', 2, False);
  AddCatalogItem('Discord', 's0047', 2, False);
  AddCatalogItem('Epic Games', 's0048', 2, False);
  AddCatalogItem('FL Studio', 's0049', 2, False);
  AddCatalogItem('LocalSend', 's0050', 2, False);
  AddCatalogItem('Microsoft Office', 's0051', 2, False);
  AddCatalogItem('OBS Studio', 's0052', 2, False);
  AddCatalogItem('Steam', 's0053', 2, False);
  AddCatalogItem('Torrent', 's0054', 2, False);
  AddCatalogItem('Разработка', '', 1, True);
  AddCatalogItem('Visual Studio', 's0055', 2, False);
  AddCatalogItem('Visual Studio Code', 's0056', 2, False);
  AddCatalogItem('Windows and Microsoft Office (KMS Auto)', 's0057', 2, False);

  AddFileItem('Архивы и описания', '', 0, True);
  AddFileItem('Софт-Portable.rar', 'f0057', 1, False);
  AddFileItem('Описание архива Portable', 'f0058', 1, False);
  AddFileItem('Софт-SetUp.rar', 'f0059', 1, False);
  AddFileItem('Описание архива Setup', 'f0060', 1, False);
  AddFileItem('Документы', '', 0, True);
  AddFileItem('ReadMe — DOCX', 'f0061', 1, False);
  AddFileItem('ReadMe — TXT', 'f0062', 1, False);
  AddFileItem('Отдельные файлы Setup', '', 0, True);
  AddFileItem('Adobe Acrobat Pro', '', 1, True);
  AddFileItem('Adobe.Acrobat.Pro.2025.u25.x64.Multilingual.iso', 'f0063', 2, False);
  AddFileItem('Adobe.Acrobat.Pro.2025.u25.x64.Multilingual.md5', 'f0064', 2, False);
  AddFileItem('Adobe.Acrobat.Pro.2025.u25.x64.Multilingual.sfv', 'f0065', 2, False);
  AddFileItem('Adobe.Acrobat.Pro.2025.u25.x64.Multilingual.sha', 'f0066', 2, False);
  AddFileItem('Adobe After Effects', '', 1, True);
  AddFileItem('Adobe After Effects 2024 24.6.2.002.iso', 'f0067', 2, False);
  AddFileItem('Adobe Animate', '', 1, True);
  AddFileItem('Adobe Animate 2022 v22.0.4.185 x64 Multilingual.iso', 'f0068', 2, False);
  AddFileItem('Adobe Lightroom Classic', '', 1, True);
  AddFileItem('AUTORUN.exe', 'f0069', 2, False);
  AddFileItem('AUTORUN.inf', 'f0070', 2, False);
  AddFileItem('AIDA 64', '', 1, True);
  AddFileItem('aida64extreme520_3400.exe', 'f0071', 2, False);
  AddFileItem('Blender 3D', '', 1, True);
  AddFileItem('blender-5.2.3-windows-x64.msi', 'f0072', 2, False);
  AddFileItem('Discord', '', 1, True);
  AddFileItem('DiscordSetup.exe', 'f0073', 2, False);
  AddFileItem('Epic Games', '', 1, True);
  AddFileItem('EpicInstaller-20.3.3.msi', 'f0074', 2, False);
  AddFileItem('FL Studio', '', 1, True);
  AddFileItem('flstudio_win64_26.1.7.5654.exe', 'f0075', 2, False);
  AddFileItem('Illustrator', '', 1, True);
  AddFileItem('Adobe.Illustrator.2024.Multilingual.iso', 'f0076', 2, False);
  AddFileItem('Adobe.Illustrator.2024.Multilingual.md5', 'f0077', 2, False);
  AddFileItem('Adobe.Illustrator.2024.Multilingual.sfv', 'f0078', 2, False);
  AddFileItem('Adobe.Illustrator.2024.Multilingual.sha', 'f0079', 2, False);
  AddFileItem('InDesign', '', 1, True);
  AddFileItem('Adobe.InDesign.2025.u6.Multilingual.iso', 'f0080', 2, False);
  AddFileItem('Adobe.InDesign.2025.u6.Multilingual.iso.md5', 'f0081', 2, False);
  AddFileItem('Adobe.InDesign.2025.u6.Multilingual.iso.sfv', 'f0082', 2, False);
  AddFileItem('Adobe.InDesign.2025.u6.Multilingual.iso.sha', 'f0083', 2, False);
  AddFileItem('LocalSend', '', 1, True);
  AddFileItem('LocalSend-1.18.2-windows-x86-64.exe', 'f0084', 2, False);
  AddFileItem('Microsoft Office', '', 1, True);
  AddFileItem('OfficeSetup.exe', 'f0085', 2, False);
  AddFileItem('Не устанавливается.txt', 'f0086', 2, False);
  AddFileItem('OBS Studio', '', 1, True);
  AddFileItem('OBS-Studio-33.0.1-Windows-x64-Installer.exe', 'f0087', 2, False);
  AddFileItem('Premier', '', 1, True);
  AddFileItem('autoplay.exe', 'f0088', 2, False);
  AddFileItem('autorun.inf', 'f0089', 2, False);
  AddFileItem('Steam', '', 1, True);
  AddFileItem('SteamSetup.exe', 'f0090', 2, False);
  AddFileItem('Torrent', '', 1, True);
  AddFileItem('utorrent_installer.exe', 'f0091', 2, False);
  AddFileItem('WinRar', '', 1, True);
  AddFileItem('winrar-x64-723ru.exe', 'f0092', 2, False);
  AddFileItem('Браузеры', '', 1, True);
  AddFileItem('ChromeSetup.exe', 'f0093', 2, False);
  AddFileItem('Firefox Installer.exe', 'f0094', 2, False);
  AddFileItem('MicrosoftEdgeSetup.exe', 'f0095', 2, False);
  AddFileItem('OperaSetup.exe', 'f0096', 2, False);
  AddFileItem('Yandex.exe', 'f0097', 2, False);
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID = SelectionPage.ID then
  begin
    CatalogList.Visible := ModePage.SelectedValueIndex = 0;
    FilesList.Visible := ModePage.SelectedValueIndex = 1;
  end;
end;

function ShouldSkipPage(PageID: Integer): Boolean;
begin
  Result := PageID = wpSelectComponents;
end;

function NextButtonClick(CurPageID: Integer): Boolean;
var
  Index: Integer;
begin
  Result := True;
  if CurPageID = SelectionPage.ID then
  begin
    SelectedItems.Clear;
    if ModePage.SelectedValueIndex = 0 then
    begin
      for Index := 0 to CatalogIDs.Count - 1 do
        if (CatalogIDs[Index] <> '') and CatalogList.Checked[Index] then
          SelectedItems.Add(CatalogIDs[Index]);
    end
    else
    begin
      for Index := 0 to FileIDs.Count - 1 do
        if (FileIDs[Index] <> '') and FilesList.Checked[Index] then
          SelectedItems.Add(FileIDs[Index]);
    end;

    if SelectedItems.Count = 0 then
    begin
      MsgBox('Ничего не выбрано. Отметьте хотя бы один пункт, чтобы продолжить.',
        mbInformation, MB_OK);
      Result := False;
    end;
  end;
end;
