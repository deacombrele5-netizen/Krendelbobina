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
; Целевая версия компилятора: Inno Setup 7.1.1 (64-bit).
; Интерфейс: стандартные страницы мастера Inno Setup с тёмным оформлением.
; Каталог отображается в двух независимых параллельных окнах со своей прокруткой:
; слева установщики программ, справа портативные программы.
; Каждый пункт каталога напрямую связан с конкретным исходным путём в секции [Files].
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
#define private CalcDirSize(str path, int size = 0) \
    CalcFileSize(path, FindFirst(AddBackslash(path) + '*', faAnyFile), size)
#define private CalcFileSize(str path, int handle, int size) \
    handle ? CalcFileSizeFilterPath(path, handle, size) : size
#define private CalcFileSizeFilterPath(str path, int handle, int size) \
    FindGetFileName(handle) == '.' || FindGetFileName(handle) == '..' ? \
        GoToNextFile(path, handle, size) : \
        CalcFileSizeTestIfDir(path, handle, size, AddBackslash(path) + FindGetFileName(handle))
#define private GoToNextFile(str path, int handle, int size) \
    FindNext(handle) ? CalcFileSizeFilterPath(path, handle, size) : (FindClose(handle), size)
#define private CalcFileSizeTestIfDir(str path, int handle, int size, str filename) \
    DirExists(filename) ? CalcDirSize(filename) + GoToNextFile(path, handle, size) : \
        GoToNextFile(path, handle, size + FileSize(filename))
#define OutputRoot MySoftRoot + "\Софт\Софт - установка"
#define PortableArchiveSizeValue FileSize(PortableArchiveRoot + "\Софт-Portable.rar")
#define SetupArchiveSizeValue FileSize(SetupArchiveRoot + "\Софт-SetUp.rar")
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
DefaultDialogFontName=Arial
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
Source: "{#SetupRoot}\Visual Studio (and Code version)\VS\*"; DestDir: "{code:GetTargetFolder|Visual Studio}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('s_vs_vs')
Source: "{#SetupRoot}\Visual Studio (and Code version)\VS Code\*"; DestDir: "{code:GetTargetFolder|Visual Studio Code}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('s_vs_code')
Source: "{#SetupRoot}\Браузеры\ChromeSetup.exe"; DestDir: "{code:GetTargetFolder|Google Chrome}"; Flags: ignoreversion; Check: IsItemSelected('s_browser_chrome')
Source: "{#SetupRoot}\Браузеры\Firefox Installer.exe"; DestDir: "{code:GetTargetFolder|Firefox}"; Flags: ignoreversion; Check: IsItemSelected('s_browser_firefox')
Source: "{#SetupRoot}\Браузеры\MicrosoftEdgeSetup.exe"; DestDir: "{code:GetTargetFolder|Microsoft Edge}"; Flags: ignoreversion; Check: IsItemSelected('s_browser_edge')
Source: "{#SetupRoot}\Браузеры\OperaSetup.exe"; DestDir: "{code:GetTargetFolder|Opera}"; Flags: ignoreversion; Check: IsItemSelected('s_browser_opera')
Source: "{#SetupRoot}\Браузеры\Yandex.exe"; DestDir: "{code:GetTargetFolder|Яндекс браузер}"; Flags: ignoreversion; Check: IsItemSelected('s_browser_yandex')
Source: "{#PortableArchiveRoot}\Софт-Portable.rar"; DestDir: "{code:GetDestinationPath}"; Flags: ignoreversion; Check: IsItemSelected('a_portable')
Source: "{#PortableArchiveRoot}\Информация об архиве - Софт-Portable.txt"; DestDir: "{code:GetDestinationPath}"; Flags: ignoreversion; Check: IsItemSelected('a_portable')
Source: "{#SetupArchiveRoot}\Софт-SetUp.rar"; DestDir: "{code:GetDestinationPath}"; Flags: ignoreversion; Check: IsItemSelected('a_setup')
Source: "{#SetupArchiveRoot}\Информация об архиве - Софт-SetUp.txt"; DestDir: "{code:GetDestinationPath}"; Flags: ignoreversion; Check: IsItemSelected('a_setup')

[Code]

const
  PortableArchiveBytes = {#PortableArchiveSizeValue};
  SetupArchiveBytes = {#SetupArchiveSizeValue};

var
  InstallModePage: TInputOptionWizardPage;
  CatalogPage: TWizardPage;
  ArchivePage: TInputOptionWizardPage;
  SetupCheckList: TNewCheckListBox;
  PortableCheckList: TNewCheckListBox;
  SetupItemIDs: TStringList;
  PortableItemIDs: TStringList;
  SetupItemSizes: TStringList;
  PortableItemSizes: TStringList;
  CatalogSpaceLabel: TNewStaticText;

function FormatArchiveSize(const Bytes: Int64): String;
begin
  if Bytes >= 1073741824 then
    Result := IntToStr((Bytes + 536870912) div 1073741824) + ' ГБ'
  else if Bytes >= 1048576 then
    Result := IntToStr((Bytes + 524288) div 1048576) + ' МБ'
  else if Bytes >= 1024 then
    Result := IntToStr((Bytes + 512) div 1024) + ' КБ'
  else
    Result := IntToStr(Bytes) + ' Б';
end;

procedure UpdateCatalogSpace;
var
  RequiredBytes, FreeBytes, TotalBytes: Int64;
  I: Integer;
begin
  RequiredBytes := 0;
  for I := 0 to SetupItemSizes.Count - 1 do
    if SetupCheckList.Checked[I] then
      RequiredBytes := RequiredBytes + StrToInt64(SetupItemSizes[I]);
  for I := 0 to PortableItemSizes.Count - 1 do
    if PortableCheckList.Checked[I] then
      RequiredBytes := RequiredBytes + StrToInt64(PortableItemSizes[I]);

  if GetSpaceOnDisk64(WizardDirValue, FreeBytes, TotalBytes) then
    CatalogSpaceLabel.Caption := 'Требуется: ' + FormatArchiveSize(RequiredBytes) +
      '     Свободно: ' + FormatArchiveSize(FreeBytes)
  else
    CatalogSpaceLabel.Caption := 'Требуется: ' + FormatArchiveSize(RequiredBytes);
end;

procedure CatalogSelectionChanged(Sender: TObject);
begin
  UpdateCatalogSpace;
end;

function CreateRoundRectRgn(X1, Y1, X2, Y2, X3, Y3: Integer): THandle;
external 'CreateRoundRectRgn@gdi32.dll stdcall';

function SetWindowRgn(hWnd: HWND; hRgn: THandle; bRedraw: Boolean): Integer;
external 'SetWindowRgn@user32.dll stdcall';

procedure ApplyRoundedCorners(Control: TWinControl);
var
  Region: THandle;
begin
  Region := CreateRoundRectRgn(0, 0, Control.Width + 1, Control.Height + 1,
    ScaleX(12), ScaleY(12));
  if Region <> 0 then
    SetWindowRgn(Control.Handle, Region, True);
end;

procedure UpdateArchiveSpace;
var
  RequiredBytes: Int64;
begin
  RequiredBytes := 0;
  if ArchivePage.Values[0] then
    RequiredBytes := RequiredBytes + PortableArchiveBytes;
  if ArchivePage.Values[1] then
    RequiredBytes := RequiredBytes + SetupArchiveBytes;
  ArchivePage.SubCaptionLabel.Caption :=
    'Требуемое место: ' + FormatArchiveSize(RequiredBytes);
end;

procedure ArchiveSelectionChanged(Sender: TObject);
begin
  UpdateArchiveSpace;
end;

procedure AddCatalogItem(ListBox: TNewCheckListBox; ItemIDs, ItemSizes: TStringList;
  const ItemID, Caption: String; const SizeBytes: Int64);
begin
  ItemIDs.Add(ItemID);
  ItemSizes.Add(IntToStr(SizeBytes));
  ListBox.AddCheckBox(Caption, '', 0, False, True, False, True, nil);
end;

procedure InitializeWizard;
var
  SetupHeader, PortableHeader: TNewStaticText;
  ColumnWidth, ColumnGap, ListTop, ListHeight: Integer;
begin
  InstallModePage := CreateInputOptionPage(wpSelectDir,
    'Выбор способа установки',
    'Выберите, что установить: программы из каталога или готовые архивы.',
    'Выберите один из двух вариантов:',
    True, False);
  InstallModePage.Add('Выбор из каталога');
  InstallModePage.Add('Выбор архива');
  InstallModePage.SelectedValueIndex := 0;

  CatalogPage := CreateCustomPage(InstallModePage.ID,
    'Выбор программ',
    'Отметьте программы, файлы которых нужно разместить в выбранной папке.');

  SetupItemIDs := TStringList.Create;
  PortableItemIDs := TStringList.Create;
  SetupItemSizes := TStringList.Create;
  PortableItemSizes := TStringList.Create;

  ColumnGap := ScaleX(18);
  ColumnWidth := (CatalogPage.SurfaceWidth - ColumnGap) div 2;
  ListTop := ScaleY(28);
  ListHeight := CatalogPage.SurfaceHeight - ListTop - ScaleY(30);

  SetupHeader := TNewStaticText.Create(CatalogPage);
  SetupHeader.Parent := CatalogPage.Surface;
  SetupHeader.Left := 0;
  SetupHeader.Top := 0;
  SetupHeader.Width := ColumnWidth;
  SetupHeader.Height := ScaleY(24);
  SetupHeader.Caption := 'Установщики программ';
  SetupHeader.Alignment := taCenter;
  SetupHeader.Font.Name := 'Arial';
  SetupHeader.Font.Size := 10;
  SetupHeader.Font.Style := [fsBold];

  PortableHeader := TNewStaticText.Create(CatalogPage);
  PortableHeader.Parent := CatalogPage.Surface;
  PortableHeader.Left := ColumnWidth + ColumnGap;
  PortableHeader.Top := 0;
  PortableHeader.Width := CatalogPage.SurfaceWidth - PortableHeader.Left;
  PortableHeader.Height := ScaleY(24);
  PortableHeader.Caption := 'Портативные программы';
  PortableHeader.Alignment := taCenter;
  PortableHeader.Font.Name := 'Arial';
  PortableHeader.Font.Size := 10;
  PortableHeader.Font.Style := [fsBold];

  SetupCheckList := TNewCheckListBox.Create(CatalogPage);
  SetupCheckList.Parent := CatalogPage.Surface;
  SetupCheckList.Left := 0;
  SetupCheckList.Top := ListTop;
  SetupCheckList.Width := ColumnWidth;
  SetupCheckList.Height := ListHeight;
  SetupCheckList.Anchors := [akLeft, akTop, akBottom];
  SetupCheckList.Flat := False;
  SetupCheckList.ShowLines := False;
  SetupCheckList.BorderStyle := bsSingle;
  SetupCheckList.Font.Name := 'Arial';
  SetupCheckList.Font.Size := 9;
  SetupCheckList.OnClickCheck := @CatalogSelectionChanged;
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, 's_adobe_acrobat', 'Adobe Acrobat Pro', {#CalcDirSize(SetupRoot\Adobe Acrobat Pro)});
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, 's_adobe_aftereffects', 'Adobe After Effects', {#CalcDirSize(SetupRoot\Adobe After Effects)});
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, 's_adobe_animate', 'Adobe Animate', {#CalcDirSize(SetupRoot\Adobe Animate)});
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, 's_adobe_audition', 'Adobe Audition', {#CalcDirSize(SetupRoot\Adobe Audition)});
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, 's_adobe_lightroom', 'Adobe Lightroom Classic', {#CalcDirSize(SetupRoot\Adobe Lightroom Classic)});
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, 's_adobe_substance', 'Adobe Substance 3D Painter', {#CalcDirSize(SetupRoot\Adobe Substance 3D Painter)});
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, 's_aida64', 'AIDA 64', {#CalcDirSize(SetupRoot\AIDA 64)});
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, 's_blender', 'Blender 3D', {#CalcDirSize(SetupRoot\Blender 3D)});
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, 's_discord', 'Discord', {#CalcDirSize(SetupRoot\Discord)});
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, 's_epic', 'Epic Games', {#CalcDirSize(SetupRoot\Epic Games)});
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, 's_flstudio', 'FL Studio', {#CalcDirSize(SetupRoot\FL Studio)});
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, 's_illustrator', 'Adobe Illustrator', {#CalcDirSize(SetupRoot\Illustrator)});
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, 's_indesign', 'Adobe InDesign', {#CalcDirSize(SetupRoot\InDesign)});
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, 's_localsend', 'LocalSend', {#CalcDirSize(SetupRoot\LocalSend)});
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, 's_office', 'Microsoft Office', {#CalcDirSize(SetupRoot\Microsoft Office)});
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, 's_obs', 'OBS Studio', {#CalcDirSize(SetupRoot\OBS Studio)});
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, 's_photoshop', 'Adobe Photoshop', {#CalcDirSize(SetupRoot\Photoshop)});
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, 's_premier', 'Adobe Premiere Pro', {#CalcDirSize(SetupRoot\Premier)});
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, 's_steam', 'Steam', {#CalcDirSize(SetupRoot\Steam)});
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, 's_torrent', 'Torrent', {#CalcDirSize(SetupRoot\Torrent)});
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, 's_winrar', 'WinRAR', {#CalcDirSize(SetupRoot\WinRar)});
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, 's_vs_vs', 'Visual Studio', {#CalcDirSize(SetupRoot\Visual Studio (and Code version)\VS)});
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, 's_vs_code', 'Visual Studio Code', {#CalcDirSize(SetupRoot\Visual Studio (and Code version)\VS Code)});
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, 's_browser_chrome', 'Google Chrome', {#FileSize(SetupRoot\Браузеры\ChromeSetup.exe)});
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, 's_browser_firefox', 'Mozilla Firefox', {#FileSize(SetupRoot\Браузеры\Firefox Installer.exe)});
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, 's_browser_edge', 'Microsoft Edge', {#FileSize(SetupRoot\Браузеры\MicrosoftEdgeSetup.exe)});
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, 's_browser_opera', 'Opera', {#FileSize(SetupRoot\Браузеры\OperaSetup.exe)});
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, 's_browser_yandex', 'Яндекс Браузер', {#FileSize(SetupRoot\Браузеры\Yandex.exe)});

  PortableCheckList := TNewCheckListBox.Create(CatalogPage);
  PortableCheckList.Parent := CatalogPage.Surface;
  PortableCheckList.Left := ColumnWidth + ColumnGap;
  PortableCheckList.Top := ListTop;
  PortableCheckList.Width := CatalogPage.SurfaceWidth - PortableCheckList.Left;
  PortableCheckList.Height := ListHeight;
  PortableCheckList.Anchors := [akRight, akTop, akBottom];
  PortableCheckList.Flat := False;
  PortableCheckList.ShowLines := False;
  PortableCheckList.BorderStyle := bsSingle;
  PortableCheckList.Font.Name := 'Arial';
  PortableCheckList.Font.Size := 9;
  PortableCheckList.OnClickCheck := @CatalogSelectionChanged;
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, 'p_adobe_acrobat', 'Adobe Acrobat Pro', {#CalcDirSize(PortableRoot\AdobeAcrobatPro-Portable)});
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, 'p_adobe_aftereffects', 'Adobe After Effects', {#CalcDirSize(PortableRoot\AdobeAfterEffects-Portable)});
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, 'p_adobe_audition', 'Adobe Audition', {#CalcDirSize(PortableRoot\AdobeAudition-Portable)});
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, 'p_adobe_illustrator', 'Adobe Illustrator', {#CalcDirSize(PortableRoot\AdobeIllustrator-Portable)});
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, 'p_adobe_photoshop', 'Adobe Photoshop', {#CalcDirSize(PortableRoot\AdobePhotoshop-Portable)});
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, 'p_adobe_premiere', 'Adobe Premiere Pro', {#CalcDirSize(PortableRoot\AdobePremierePro-Portable)});
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, 'p_aida64', 'AIDA64', {#CalcDirSize(PortableRoot\AIDA64-Portable)});
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, 'p_anydesk', 'AnyDesk', {#CalcDirSize(PortableRoot\AnyDesk-Portable)});
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, 'p_blender', 'Blender', {#CalcDirSize(PortableRoot\Blender-Portable)});
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, 'p_easy2boot', 'Easy2Boot', {#CalcDirSize(PortableRoot\Easy2Boot-Portable)});
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, 'p_encryptonclick', 'EncryptOnClick', {#CalcDirSize(PortableRoot\EncryptOnClick-Portable)});
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, 'p_chrome', 'Google Chrome', {#CalcDirSize(PortableRoot\GoogleChrome-Portable)});
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, 'p_imgburn', 'ImgBurn', {#CalcDirSize(PortableRoot\ImgBurn-Portable)});
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, 'p_localsend', 'LocalSend', {#CalcDirSize(PortableRoot\LocalSend-Portable)});
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, 'p_scanner', 'Microsoft Scanner', {#CalcDirSize(PortableRoot\MicrosoftScaner-Portable)});
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, 'p_nsis', 'NSIS', {#CalcDirSize(PortableRoot\NSIS-Portable)});
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, 'p_obs', 'OBS Studio', {#CalcDirSize(PortableRoot\OBS-Studio-Portable)});
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, 'p_portablecreator', 'Portable Creator', {#CalcDirSize(PortableRoot\PortableCreator-Portable)});
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, 'p_putty', 'PuTTY', {#CalcDirSize(PortableRoot\PuTTY-Portable)});
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, 'p_rufus', 'Rufus', {#CalcDirSize(PortableRoot\Rufus-Portable)});
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, 'p_sysinternals', 'Sysinternals Suite', {#CalcDirSize(PortableRoot\SysinternalsSuite-Portable)});
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, 'p_utorrent', 'µTorrent', {#CalcDirSize(PortableRoot\uTorrent-Portable)});
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, 'p_vlc', 'VLC Media Player', {#CalcDirSize(PortableRoot\VlcMediaPlayer-Portable)});
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, 'p_vscode', 'Visual Studio Code', {#CalcDirSize(PortableRoot\VSCode-Portable)});
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, 'p_wifiinfoview', 'WifiInfoView', {#CalcDirSize(PortableRoot\Wifiinfoview-Portable)});
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, 'p_winnote', 'WinNotepad', {#CalcDirSize(PortableRoot\WinNotepad-Portable)});
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, 'p_winpowershell', 'WinPowerShell', {#CalcDirSize(PortableRoot\WinPowerShel-Portable)});
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, 'p_winrar', 'WinRAR', {#CalcDirSize(PortableRoot\WinRAR-Portable)});
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, 'p_winscp', 'WinSCP', {#CalcDirSize(PortableRoot\WinSCP-Portable)});
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, 'p_winsetup', 'WinSetupFromUSB', {#CalcDirSize(PortableRoot\WinSetupFromUSB-Portable)});
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, 'p_winterminal', 'Windows Terminal', {#CalcDirSize(PortableRoot\WinTerminal-Portable)});
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, 'p_wnetwatcher', 'WNetWatcher', {#CalcDirSize(PortableRoot\Wnet-Watcher-Portable)});


  CatalogSpaceLabel := TNewStaticText.Create(CatalogPage);
  CatalogSpaceLabel.Parent := CatalogPage.Surface;
  CatalogSpaceLabel.Left := 0;
  CatalogSpaceLabel.Top := ListTop + ListHeight + ScaleY(3);
  CatalogSpaceLabel.Width := CatalogPage.SurfaceWidth;
  CatalogSpaceLabel.Height := ScaleY(22);
  CatalogSpaceLabel.Anchors := [akLeft, akRight, akBottom];
  CatalogSpaceLabel.Font.Name := 'Arial';
  CatalogSpaceLabel.Font.Size := 9;

  ApplyRoundedCorners(SetupCheckList);
  ApplyRoundedCorners(PortableCheckList);
  UpdateCatalogSpace;

  ArchivePage := CreateInputOptionPage(CatalogPage.ID,
    'Выбор архивов',
    'Выберите архивы для установки.',
    '',
    False, False);
  ArchivePage.Add('Архив с портативными программами');
  ArchivePage.Add('Установщики программ');
  ArchivePage.CheckListBox.OnClickCheck := @ArchiveSelectionChanged;
  UpdateArchiveSpace;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID = CatalogPage.ID then
    UpdateCatalogSpace;
end;

function ShouldSkipPage(PageID: Integer): Boolean;
begin
  if PageID = CatalogPage.ID then
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
var
  Index: Integer;
begin
  Result := False;
  if Copy(ItemID, 1, 2) = 'p_' then
  begin
    Index := PortableItemIDs.IndexOf(ItemID);
    if Index >= 0 then
      Result := PortableCheckList.Checked[Index];
  end
  else if Copy(ItemID, 1, 2) = 's_' then
  begin
    Index := SetupItemIDs.IndexOf(ItemID);
    if Index >= 0 then
      Result := SetupCheckList.Checked[Index];
  end
  else if ItemID = 'a_portable' then
    Result := ArchivePage.Values[0]
  else if ItemID = 'a_setup' then
    Result := ArchivePage.Values[1];
end;

function HasAnySelection: Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to PortableItemIDs.Count - 1 do
    if PortableCheckList.Checked[I] then
    begin
      Result := True;
      Exit;
    end;
  for I := 0 to SetupItemIDs.Count - 1 do
    if SetupCheckList.Checked[I] then
    begin
      Result := True;
      Exit;
    end;
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := True;
  if (CurPageID = CatalogPage.ID) and (not HasAnySelection) then
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
