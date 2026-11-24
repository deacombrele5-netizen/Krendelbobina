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
; Каталог отображается в двух колонках без рамок; используется одна общая
; вертикальная прокрутка справа, синхронизирующая обе колонки.
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
#define OutputRoot MySoftRoot + "\Софт\Софт - установка"
#define PortableArchiveSizeValue (FileSize(PortableArchiveRoot + "\Софт-Portable.rar") + FileSize(PortableArchiveRoot + "\Информация об архиве - Софт-Portable.txt"))
#define SetupArchiveSizeValue (FileSize(SetupArchiveRoot + "\Софт-SetUp.rar") + FileSize(SetupArchiveRoot + "\Информация об архиве - Софт-SetUp.txt"))
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
SolidCompression=no
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

function GetScrollPos(hWnd: HWND; nBar: Integer): Integer;
  external 'GetScrollPos@user32.dll stdcall';
function SendMessage(hWnd: HWND; Msg: LongWord; wParam: Longint; lParam: Longint): Longint;
  external 'SendMessageW@user32.dll stdcall';
function ShowScrollBar(hWnd: HWND; wBar: LongWord; bShow: BOOL): BOOL;
  external 'ShowScrollBar@user32.dll stdcall';
function SetTimer(hWnd: HWND; nIDEvent, uElapse: LongWord; lpTimerFunc: Longint): LongWord;
  external 'SetTimer@user32.dll stdcall';
function KillTimer(hWnd: HWND; uIDEvent: LongWord): BOOL;
  external 'KillTimer@user32.dll stdcall';

var
  CatalogScrollTimer: LongWord;
  LastSetupScrollPos: Integer;
  LastPortableScrollPos: Integer;
  CatalogScrollSyncReady: Boolean;
  InstallModePage: TInputOptionWizardPage;
  CatalogPage: TWizardPage;
  ArchivePage: TInputOptionWizardPage;
  SetupCheckList: TNewCheckListBox;
  PortableCheckList: TNewCheckListBox;
  SetupItemIDs: TStringList;
  PortableItemIDs: TStringList;
  SelectedItemIDs: TStringList;
  SetupItemSizes: TStringList;
  PortableItemSizes: TStringList;
  SetupItemPaths: TStringList;
  PortableItemPaths: TStringList;
  CatalogSpaceLabel: TNewStaticText;
  CatalogLoadingPage: TOutputProgressWizardPage;
  CatalogSourcesScanned: Boolean;

function GetDirectorySize(const DirName: String): Int64;
var
  FindRec: TFindRec;
  ItemPath: String;
begin
  Result := 0;
  if not DirExists(DirName) then
    Exit;
  if FindFirst(AddBackslash(DirName) + '*', FindRec) then
  begin
    try
      repeat
        if (FindRec.Name <> '.') and (FindRec.Name <> '..') then
        begin
          ItemPath := AddBackslash(DirName) + FindRec.Name;
          if (FindRec.Attributes and FILE_ATTRIBUTE_DIRECTORY) <> 0 then
            Result := Result + GetDirectorySize(ItemPath)
          else
            Result := Result + Int64(FindRec.SizeHigh) * 4294967296 + FindRec.SizeLow;
        end;
      until not FindNext(FindRec);
    finally
      FindClose(FindRec);
    end;
  end;
end;

function GetFileSizeSafe(const FileName: String): Int64;
var
  FindRec: TFindRec;
begin
  Result := 0;
  if FindFirst(FileName, FindRec) then
  begin
    Result := Int64(FindRec.SizeHigh) * 4294967296 + FindRec.SizeLow;
    FindClose(FindRec);
  end;
end;

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

procedure UpdateArchiveSpace;
var
  RequiredBytes, FreeBytes, TotalBytes: Int64;
begin
  RequiredBytes := 0;
  if ArchivePage.Values[0] then
    RequiredBytes := RequiredBytes + PortableArchiveBytes;
  if ArchivePage.Values[1] then
    RequiredBytes := RequiredBytes + SetupArchiveBytes;

  if GetSpaceOnDisk64(WizardDirValue, FreeBytes, TotalBytes) then
    ArchivePage.SubCaptionLabel.Caption :=
      'Требуемое место: ' + FormatArchiveSize(RequiredBytes) +
      '     Свободно: ' + FormatArchiveSize(FreeBytes)
  else
    ArchivePage.SubCaptionLabel.Caption :=
      'Требуемое место: ' + FormatArchiveSize(RequiredBytes);
end;

procedure ArchiveSelectionChanged(Sender: TObject);
begin
  UpdateArchiveSpace;
end;

procedure AddCatalogItem(ListBox: TNewCheckListBox; ItemIDs, ItemSizes, ItemPaths: TStringList;
  const ItemID, Caption, SourcePath: String);
begin
  ItemIDs.Add(ItemID);
  ItemSizes.Add('0');
  ItemPaths.Add(SourcePath);
  ListBox.AddCheckBox(Caption, '', 0, False, True, False, True, nil);
end;

procedure ScanCatalogSources;
var
  I, Total, DoneCount, Percent: Integer;
  SourcePath: String;
  SizeBytes: Int64;
begin
  if CatalogSourcesScanned then
    Exit;

  Total := SetupItemPaths.Count + PortableItemPaths.Count;
  DoneCount := 0;
  CatalogLoadingPage.Show;
  try
    { Paint the loading page before starting the directory scan. SetProgress
      also pumps the Windows message queue so the progress UI stays responsive. }
    CatalogLoadingPage.SetProgress(0, Total);
    CatalogLoadingPage.SetText('', '0%');

    for I := 0 to SetupItemPaths.Count - 1 do
    begin
      SourcePath := SetupItemPaths[I];
      if DirExists(SourcePath) then
        SizeBytes := GetDirectorySize(SourcePath)
      else
        SizeBytes := GetFileSizeSafe(SourcePath);
      SetupItemSizes[I] := IntToStr(SizeBytes);
      Inc(DoneCount);
      Percent := (DoneCount * 100) div Total;
      CatalogLoadingPage.SetText('', IntToStr(Percent) + '%');
      CatalogLoadingPage.SetProgress(DoneCount, Total);
    end;

    for I := 0 to PortableItemPaths.Count - 1 do
    begin
      SourcePath := PortableItemPaths[I];
      if DirExists(SourcePath) then
        SizeBytes := GetDirectorySize(SourcePath)
      else
        SizeBytes := GetFileSizeSafe(SourcePath);
      PortableItemSizes[I] := IntToStr(SizeBytes);
      Inc(DoneCount);
      Percent := (DoneCount * 100) div Total;
      CatalogLoadingPage.SetText('', IntToStr(Percent) + '%');
      CatalogLoadingPage.SetProgress(DoneCount, Total);
    end;

    CatalogSourcesScanned := True;
  finally
    CatalogLoadingPage.Hide;
  end;

  UpdateCatalogSpace;
end;

procedure InitializeWizard;
var
  SetupHeader, PortableHeader: TNewStaticText;
  ColumnWidth, ColumnGap, ListTop, ListHeight: Integer;
begin
  WizardForm.FilenameLabel.Font.Size := 8;

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
  SelectedItemIDs := TStringList.Create;
  SetupItemSizes := TStringList.Create;
  PortableItemSizes := TStringList.Create;
  SetupItemPaths := TStringList.Create;
  PortableItemPaths := TStringList.Create;
  CatalogSourcesScanned := False;

  { Keep both catalog columns broad; the narrow center gap gives each side more room. }
  ColumnGap := ScaleX(6);
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
  SetupCheckList.Flat := True;
  SetupCheckList.ShowLines := False;
  SetupCheckList.BorderStyle := bsNone;
  SetupCheckList.Color := CatalogPage.SurfaceColor;

  SetupCheckList.MinItemHeight := ScaleY(22);
  SetupCheckList.OnClickCheck := @CatalogSelectionChanged;
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, SetupItemPaths, 's_adobe_acrobat', 'Adobe Acrobat Pro', '{#SetupRoot}\Adobe Acrobat Pro');
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, SetupItemPaths, 's_adobe_aftereffects', 'Adobe After Effects', '{#SetupRoot}\Adobe After Effects');
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, SetupItemPaths, 's_adobe_animate', 'Adobe Animate', '{#SetupRoot}\Adobe Animate');
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, SetupItemPaths, 's_adobe_audition', 'Adobe Audition', '{#SetupRoot}\Adobe Audition');
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, SetupItemPaths, 's_adobe_lightroom', 'Adobe Lightroom Classic', '{#SetupRoot}\Adobe Lightroom Classic');
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, SetupItemPaths, 's_adobe_substance', 'Adobe Substance 3D Painter', '{#SetupRoot}\Adobe Substance 3D Painter');
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, SetupItemPaths, 's_aida64', 'AIDA 64', '{#SetupRoot}\AIDA 64');
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, SetupItemPaths, 's_blender', 'Blender 3D', '{#SetupRoot}\Blender 3D');
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, SetupItemPaths, 's_discord', 'Discord', '{#SetupRoot}\Discord');
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, SetupItemPaths, 's_epic', 'Epic Games', '{#SetupRoot}\Epic Games');
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, SetupItemPaths, 's_flstudio', 'FL Studio', '{#SetupRoot}\FL Studio');
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, SetupItemPaths, 's_illustrator', 'Adobe Illustrator', '{#SetupRoot}\Illustrator');
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, SetupItemPaths, 's_indesign', 'Adobe InDesign', '{#SetupRoot}\InDesign');
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, SetupItemPaths, 's_localsend', 'LocalSend', '{#SetupRoot}\LocalSend');
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, SetupItemPaths, 's_office', 'Microsoft Office', '{#SetupRoot}\Microsoft Office');
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, SetupItemPaths, 's_obs', 'OBS Studio', '{#SetupRoot}\OBS Studio');
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, SetupItemPaths, 's_photoshop', 'Adobe Photoshop', '{#SetupRoot}\Photoshop');
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, SetupItemPaths, 's_premier', 'Adobe Premiere Pro', '{#SetupRoot}\Premier');
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, SetupItemPaths, 's_steam', 'Steam', '{#SetupRoot}\Steam');
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, SetupItemPaths, 's_torrent', 'Torrent', '{#SetupRoot}\Torrent');
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, SetupItemPaths, 's_winrar', 'WinRAR', '{#SetupRoot}\WinRar');
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, SetupItemPaths, 's_vs_vs', 'Visual Studio', '{#SetupRoot}\Visual Studio (and Code version)\VS');
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, SetupItemPaths, 's_vs_code', 'Visual Studio Code', '{#SetupRoot}\Visual Studio (and Code version)\VS Code');
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, SetupItemPaths, 's_browser_chrome', 'Google Chrome', '{#SetupRoot}\Браузеры\ChromeSetup.exe');
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, SetupItemPaths, 's_browser_firefox', 'Mozilla Firefox', '{#SetupRoot}\Браузеры\Firefox Installer.exe');
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, SetupItemPaths, 's_browser_edge', 'Microsoft Edge', '{#SetupRoot}\Браузеры\MicrosoftEdgeSetup.exe');
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, SetupItemPaths, 's_browser_opera', 'Opera', '{#SetupRoot}\Браузеры\OperaSetup.exe');
  AddCatalogItem(SetupCheckList, SetupItemIDs, SetupItemSizes, SetupItemPaths, 's_browser_yandex', 'Яндекс Браузер', '{#SetupRoot}\Браузеры\Yandex.exe');

  PortableCheckList := TNewCheckListBox.Create(CatalogPage);
  PortableCheckList.Parent := CatalogPage.Surface;
  PortableCheckList.Left := ColumnWidth + ColumnGap;
  PortableCheckList.Top := ListTop;
  PortableCheckList.Width := ColumnWidth;
  PortableCheckList.Height := ListHeight;
  PortableCheckList.Anchors := [akRight, akTop, akBottom];
  PortableCheckList.Flat := True;
  PortableCheckList.ShowLines := False;
  PortableCheckList.BorderStyle := bsNone;
  PortableCheckList.Color := CatalogPage.SurfaceColor;

  PortableCheckList.MinItemHeight := ScaleY(22);
  PortableCheckList.OnClickCheck := @CatalogSelectionChanged;
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, PortableItemPaths, 'p_adobe_acrobat', 'Adobe Acrobat Pro', '{#PortableRoot}\AdobeAcrobatPro-Portable');
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, PortableItemPaths, 'p_adobe_aftereffects', 'Adobe After Effects', '{#PortableRoot}\AdobeAfterEffects-Portable');
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, PortableItemPaths, 'p_adobe_audition', 'Adobe Audition', '{#PortableRoot}\AdobeAudition-Portable');
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, PortableItemPaths, 'p_adobe_illustrator', 'Adobe Illustrator', '{#PortableRoot}\AdobeIllustrator-Portable');
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, PortableItemPaths, 'p_adobe_photoshop', 'Adobe Photoshop', '{#PortableRoot}\AdobePhotoshop-Portable');
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, PortableItemPaths, 'p_adobe_premiere', 'Adobe Premiere Pro', '{#PortableRoot}\AdobePremierePro-Portable');
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, PortableItemPaths, 'p_aida64', 'AIDA64', '{#PortableRoot}\AIDA64-Portable');
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, PortableItemPaths, 'p_anydesk', 'AnyDesk', '{#PortableRoot}\AnyDesk-Portable');
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, PortableItemPaths, 'p_blender', 'Blender', '{#PortableRoot}\Blender-Portable');
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, PortableItemPaths, 'p_easy2boot', 'Easy2Boot', '{#PortableRoot}\Easy2Boot-Portable');
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, PortableItemPaths, 'p_encryptonclick', 'EncryptOnClick', '{#PortableRoot}\EncryptOnClick-Portable');
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, PortableItemPaths, 'p_chrome', 'Google Chrome', '{#PortableRoot}\GoogleChrome-Portable');
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, PortableItemPaths, 'p_imgburn', 'ImgBurn', '{#PortableRoot}\ImgBurn-Portable');
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, PortableItemPaths, 'p_localsend', 'LocalSend', '{#PortableRoot}\LocalSend-Portable');
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, PortableItemPaths, 'p_scanner', 'Microsoft Scanner', '{#PortableRoot}\MicrosoftScaner-Portable');
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, PortableItemPaths, 'p_nsis', 'NSIS', '{#PortableRoot}\NSIS-Portable');
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, PortableItemPaths, 'p_obs', 'OBS Studio', '{#PortableRoot}\OBS-Studio-Portable');
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, PortableItemPaths, 'p_portablecreator', 'Portable Creator', '{#PortableRoot}\PortableCreator-Portable');
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, PortableItemPaths, 'p_putty', 'PuTTY', '{#PortableRoot}\PuTTY-Portable');
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, PortableItemPaths, 'p_rufus', 'Rufus', '{#PortableRoot}\Rufus-Portable');
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, PortableItemPaths, 'p_sysinternals', 'Sysinternals Suite', '{#PortableRoot}\SysinternalsSuite-Portable');
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, PortableItemPaths, 'p_utorrent', 'µTorrent', '{#PortableRoot}\uTorrent-Portable');
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, PortableItemPaths, 'p_vlc', 'VLC Media Player', '{#PortableRoot}\VlcMediaPlayer-Portable');
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, PortableItemPaths, 'p_vscode', 'Visual Studio Code', '{#PortableRoot}\VSCode-Portable');
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, PortableItemPaths, 'p_wifiinfoview', 'WifiInfoView', '{#PortableRoot}\Wifiinfoview-Portable');
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, PortableItemPaths, 'p_winnote', 'WinNotepad', '{#PortableRoot}\WinNotepad-Portable');
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, PortableItemPaths, 'p_winpowershell', 'WinPowerShell', '{#PortableRoot}\WinPowerShel-Portable');
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, PortableItemPaths, 'p_winrar', 'WinRAR', '{#PortableRoot}\WinRAR-Portable');
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, PortableItemPaths, 'p_winscp', 'WinSCP', '{#PortableRoot}\WinSCP-Portable');
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, PortableItemPaths, 'p_winsetup', 'WinSetupFromUSB', '{#PortableRoot}\WinSetupFromUSB-Portable');
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, PortableItemPaths, 'p_winterminal', 'Windows Terminal', '{#PortableRoot}\WinTerminal-Portable');
  AddCatalogItem(PortableCheckList, PortableItemIDs, PortableItemSizes, PortableItemPaths, 'p_wnetwatcher', 'WNetWatcher', '{#PortableRoot}\Wnet-Watcher-Portable');


  CatalogSpaceLabel := TNewStaticText.Create(CatalogPage);
  CatalogSpaceLabel.Parent := CatalogPage.Surface;
  CatalogSpaceLabel.Left := 0;
  CatalogSpaceLabel.Top := ListTop + ListHeight + ScaleY(3);
  CatalogSpaceLabel.Width := CatalogPage.SurfaceWidth;
  CatalogSpaceLabel.Height := ScaleY(22);
  CatalogSpaceLabel.Anchors := [akLeft, akRight, akBottom];
  CatalogSpaceLabel.Font.Name := 'Arial';
  CatalogSpaceLabel.Font.Size := 9;

  UpdateCatalogSpace;
  CatalogLoadingPage := CreateOutputProgressPage(
    'Загрузка...', '');

  ArchivePage := CreateInputOptionPage(CatalogPage.ID,
    'Выбор архивов',
    'Выберите архивы для установки.',
    '',
    False, False);
  ArchivePage.Add('Архив с портативными программами');
  ArchivePage.Add('Установщики программ');
  ArchivePage.CheckListBox.OnClickCheck := @ArchiveSelectionChanged;
  UpdateArchiveSpace;
  
  { Match the catalog checklist typography to the standard archive selection list. }
  SetupCheckList.Font.Assign(ArchivePage.CheckListBox.Font);
  PortableCheckList.Font.Assign(ArchivePage.CheckListBox.Font);
  SetupCheckList.MinItemHeight := ArchivePage.CheckListBox.MinItemHeight;
  PortableCheckList.MinItemHeight := ArchivePage.CheckListBox.MinItemHeight;
end;

procedure CatalogScrollTimerProc(H: HWND; Msg: LongWord; IdEvent: LongWord; Time: LongWord);
var
  SetupPos, PortablePos: Integer;
begin
  if (SetupCheckList = nil) or (PortableCheckList = nil) then
    Exit;

  SetupPos := GetScrollPos(SetupCheckList.Handle, 1);
  PortablePos := GetScrollPos(PortableCheckList.Handle, 1);

  if not CatalogScrollSyncReady then
  begin
    LastSetupScrollPos := SetupPos;
    LastPortableScrollPos := PortablePos;
    CatalogScrollSyncReady := True;
  end
  else if SetupPos <> LastSetupScrollPos then
  begin
    SendMessage(PortableCheckList.Handle, $0197, SetupPos, 0); { LB_SETTOPINDEX }
    LastSetupScrollPos := SetupPos;
    LastPortableScrollPos := GetScrollPos(PortableCheckList.Handle, 1);
  end
  else if PortablePos <> LastPortableScrollPos then
  begin
    SendMessage(SetupCheckList.Handle, $0197, PortablePos, 0); { LB_SETTOPINDEX }
    LastPortableScrollPos := PortablePos;
    LastSetupScrollPos := GetScrollPos(SetupCheckList.Handle, 1);
  end;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  if not CatalogSourcesScanned then
    ScanCatalogSources;

  if CurPageID = CatalogPage.ID then
  begin
    { Keep a single visible scrollbar at the far right of the catalog. The
      timer mirrors the first visible row in the other column, regardless of
      whether the user scrolls with the wheel or drags the scrollbar thumb. }
    ShowScrollBar(SetupCheckList.Handle, 1, False);
    ShowScrollBar(PortableCheckList.Handle, 1, True);
    CatalogScrollSyncReady := False;
    if CatalogScrollTimer = 0 then
      CatalogScrollTimer := SetTimer(0, 0, 35, CreateCallback(@CatalogScrollTimerProc));
    UpdateCatalogSpace;
  end
  else if CatalogScrollTimer <> 0 then
  begin
    KillTimer(0, CatalogScrollTimer);
    CatalogScrollTimer := 0;
    CatalogScrollSyncReady := False;
  end;
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
begin
  { [Files] Check must use the frozen selection only. Wizard controls may no longer
    be the authoritative source while Setup evaluates individual file entries. }
  Result := (SelectedItemIDs <> nil) and
    (SelectedItemIDs.IndexOf(ItemID) >= 0);
  Log('SOFT: Check ' + ItemID + ' = ' + IntToStr(Ord(Result)));
end;

procedure CaptureCatalogSelection;
var
  I: Integer;
begin
  SelectedItemIDs.Clear;
  for I := 0 to PortableItemIDs.Count - 1 do
    if PortableCheckList.Checked[I] then
      SelectedItemIDs.Add(PortableItemIDs[I]);
  for I := 0 to SetupItemIDs.Count - 1 do
    if SetupCheckList.Checked[I] then
      SelectedItemIDs.Add(SetupItemIDs[I]);
end;

procedure CaptureArchiveSelection;
begin
  SelectedItemIDs.Clear;
  if ArchivePage.Values[0] then
    SelectedItemIDs.Add('a_portable');
  if ArchivePage.Values[1] then
    SelectedItemIDs.Add('a_setup');
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssInstall then
  begin
    { Do not reread wizard controls here: the immutable snapshot was captured
      in NextButtonClick before Setup begins evaluating [Files] entries. }
    Log('SOFT: frozen selection count = ' + IntToStr(SelectedItemIDs.Count));
  end;
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
  if CurPageID = CatalogPage.ID then
  begin
    if not HasAnySelection then
    begin
      MsgBox('Выберите хотя бы одну программу из каталога.', mbInformation, MB_OK);
      Result := False;
    end
    else
      CaptureCatalogSelection;
  end
  else if CurPageID = ArchivePage.ID then
  begin
    if (not ArchivePage.Values[0]) and (not ArchivePage.Values[1]) then
    begin
      MsgBox('Выберите хотя бы один архив.', mbInformation, MB_OK);
      Result := False;
    end
    else
      CaptureArchiveSelection;
  end;
end;
