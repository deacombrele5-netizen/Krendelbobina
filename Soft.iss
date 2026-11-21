; =============================================================================
; SOFT - установщик программной коллекции
;
; Назначение: выборочное копирование программ и готовых архивов из MySoft.
;
; ПЕРЕД СБОРКОЙ:
; 1. Проверьте, что исходная папка находится по пути MySoftRoot ниже.
; 2. В корне MySoftRoot должны находиться app.ico и папка "Софт (исходники)".
; 3. Структура каталогов должна соответствовать MySoft_Structure_UTF8.txt.
; 4. Откройте этот файл в Inno Setup Compiler и нажмите Compile.
;
; ВАЖНО: app.ico используется только как значок самого Setup.exe.
; Файл app.ico не добавлен в [Files] и на компьютер пользователя не копируется.
; Все содержимое выбранных папок копируется без Excludes и без выборочного
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
AllowRootDirectory=yes
AllowUNCPath=yes
UsePreviousAppDir=no
CreateAppDir=no
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
WizardSizePercent=100
SetupIconFile={#MySoftRoot}\app.ico
DefaultDialogFontName=Segoe UI
CloseApplications=no

[Messages]
SetupWindowTitle=Установка - %1
WizardSelectDir=Выбор папки установки
SelectDirDesc=В какую папку вы хотите скопировать выбранные программы?
SelectDirLabel3=Выбранные программы будут скопированы в следующую папку.
SelectDirBrowseLabel=Нажмите «Далее», чтобы продолжить. Если вы хотите выбрать другую папку, нажмите «Обзор».
WizardReady=Всё готово к установке
ReadyLabel1=Программа установки готова начать копирование выбранных файлов.
ReadyLabel2a=Нажмите «Установить», чтобы продолжить, или «Назад», если вы хотите просмотреть или изменить параметры.
ReadyLabel2b=Нажмите «Установить», чтобы продолжить.
WizardInstalling=Установка...
InstallingLabel=Пожалуйста, подождите, пока выбранные файлы копируются.
FinishedHeadingLabel=Завершение Мастера установки [name]
FinishedLabelNoIcons=Копирование выбранных файлов завершено.
FinishedLabel=Копирование выбранных файлов завершено.
ClickFinish=Нажмите «Завершить», чтобы выйти из программы установки.

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
Source: "{#SetupRoot}\Visual Studio (and Code version)\VS\*"; DestDir: "{code:GetTargetFolder|Visual Studio (and Code version)\VS}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('s_vs_all') or IsItemSelected('s_vs_vs')
Source: "{#SetupRoot}\Visual Studio (and Code version)\VS Code\*"; DestDir: "{code:GetTargetFolder|Visual Studio (and Code version)\VS Code}"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IsItemSelected('s_vs_all') or IsItemSelected('s_vs_code')
Source: "{#SetupRoot}\Браузеры\ChromeSetup.exe"; DestDir: "{code:GetTargetFolder|Браузеры}"; Flags: ignoreversion; Check: IsItemSelected('s_browsers_all') or IsItemSelected('s_browser_chrome')
Source: "{#SetupRoot}\Браузеры\Firefox Installer.exe"; DestDir: "{code:GetTargetFolder|Браузеры}"; Flags: ignoreversion; Check: IsItemSelected('s_browsers_all') or IsItemSelected('s_browser_firefox')
Source: "{#SetupRoot}\Браузеры\MicrosoftEdgeSetup.exe"; DestDir: "{code:GetTargetFolder|Браузеры}"; Flags: ignoreversion; Check: IsItemSelected('s_browsers_all') or IsItemSelected('s_browser_edge')
Source: "{#SetupRoot}\Браузеры\OperaSetup.exe"; DestDir: "{code:GetTargetFolder|Браузеры}"; Flags: ignoreversion; Check: IsItemSelected('s_browsers_all') or IsItemSelected('s_browser_opera')
Source: "{#SetupRoot}\Браузеры\Yandex.exe"; DestDir: "{code:GetTargetFolder|Браузеры}"; Flags: ignoreversion; Check: IsItemSelected('s_browsers_all') or IsItemSelected('s_browser_yandex')
Source: "{#PortableArchiveRoot}\Софт-Portable.rar"; DestDir: "{code:GetDestinationPath}"; Flags: ignoreversion; Check: IsItemSelected('a_portable')
Source: "{#PortableArchiveRoot}\Информация об архиве - Софт-Portable.txt"; DestDir: "{code:GetDestinationPath}"; Flags: ignoreversion; Check: IsItemSelected('a_portable')
Source: "{#SetupArchiveRoot}\Софт-SetUp.rar"; DestDir: "{code:GetDestinationPath}"; Flags: ignoreversion; Check: IsItemSelected('a_setup')
Source: "{#SetupArchiveRoot}\Информация об архиве - Софт-SetUp.txt"; DestDir: "{code:GetDestinationPath}"; Flags: ignoreversion; Check: IsItemSelected('a_setup')

[Code]
var
    ModePage: TWizardPage;
  CatalogPage: TWizardPage;
  ArchivePage: TWizardPage;
  CatalogList: TNewCheckListBox;
  ArchiveList: TNewCheckListBox;
  CatalogMap: TStringList;
  CatalogModeButton: TNewRadioButton;
  ArchiveModeButton: TNewRadioButton;
  ProgressPercentLabel: TNewStaticText;

function AddCatalogCheck(const ItemID, CaptionText: String; const LevelValue: Byte; const HasChildren, CheckWhenParent: Boolean): Integer;
begin
  Result := CatalogList.AddCheckBox(CaptionText, '', LevelValue, False, True, HasChildren, CheckWhenParent, nil);
  CatalogMap.Add(ItemID + '=' + IntToStr(Result));
end;

function GetCatalogIndex(const ItemID: String): Integer;
var
  I, P: Integer;
  Entry: String;
begin
  Result := -1;
  for I := 0 to CatalogMap.Count - 1 do
  begin
    Entry := CatalogMap.Strings[I];
    P := Pos('=', Entry);
    if (P > 0) and (Copy(Entry, 1, P - 1) = ItemID) then
    begin
      Result := StrToIntDef(Copy(Entry, P + 1, Length(Entry) - P), -1);
      Exit;
    end;
  end;
end;

function CatalogChecked(const ItemID: String): Boolean;
var
  I: Integer;
begin
  I := GetCatalogIndex(ItemID);
  Result := False;
  if I >= 0 then
    Result := CatalogList.Checked[I];
end;

function IsItemSelected(const ItemID: String): Boolean;
begin
  if ItemID = 'a_portable' then
    Result := ArchiveList.Checked[0]
  else if ItemID = 'a_setup' then
    Result := ArchiveList.Checked[1]
  else
    Result := CatalogChecked(ItemID);
end;

function HasAnyCatalogSelection: Boolean;
var
  I: Integer;
  ItemIndex: Integer;
begin
  Result := False;
  for I := 0 to CatalogMap.Count - 1 do
  begin
    ItemIndex := StrToIntDef(Copy(CatalogMap.Strings[I], Pos('=', CatalogMap.Strings[I]) + 1, Length(CatalogMap.Strings[I])), -1);
    if (ItemIndex >= 0) and CatalogList.Checked[ItemIndex] then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

function GetDestinationPath(Param: String): String;
begin
  Result := WizardDirValue;
end;

function GetTargetFolder(Param: String): String;
begin
  Result := AddBackslash(WizardDirValue) + Param;
end;

procedure InitializeWizard();
var
  ModeCardCatalog, ModeCardArchive, CatalogCard, ArchiveCard: TPanel;
  LogoBitmap: TBitmap;
begin
  CatalogMap := TStringList.Create;

  { Общая визуальная тема установщика }
  WizardForm.Color := $00131A23;
  WizardForm.Font.Name := 'Segoe UI';
  WizardForm.Font.Color := clWhite;
  WizardForm.MainPanel.Color := $001B2734;
  WizardForm.MainPanel.BevelOuter := bvNone;
  WizardForm.InnerPage.Color := $00131A23;
  WizardForm.Bevel.Visible := False;
  WizardForm.Bevel1.Visible := False;

  { Собственный логотип: контур папки и шестерёнка, рисуется в памяти }
  LogoBitmap := TBitmap.Create;
  LogoBitmap.Width := 64;
  LogoBitmap.Height := 64;
  LogoBitmap.Canvas.Brush.Color := $001B2734;
  LogoBitmap.Canvas.Brush.Style := bsSolid;
  LogoBitmap.Canvas.FillRect(Rect(0, 0, LogoBitmap.Width, LogoBitmap.Height));
  LogoBitmap.Canvas.Pen.Color := $00D5DCE4;
  LogoBitmap.Canvas.Pen.Width := ScaleX(2);
  LogoBitmap.Canvas.Brush.Style := bsClear;
  LogoBitmap.Canvas.MoveTo(7, 25);
  LogoBitmap.Canvas.LineTo(7, 17);
  LogoBitmap.Canvas.LineTo(22, 17);
  LogoBitmap.Canvas.LineTo(27, 22);
  LogoBitmap.Canvas.LineTo(55, 22);
  LogoBitmap.Canvas.LineTo(55, 49);
  LogoBitmap.Canvas.LineTo(7, 49);
  LogoBitmap.Canvas.LineTo(7, 25);
  { Шестерёнка расположена в нижнем правом углу папки }
  LogoBitmap.Canvas.Ellipse(40, 34, 59, 53);
  LogoBitmap.Canvas.Ellipse(46, 40, 53, 47);
  LogoBitmap.Canvas.MoveTo(49, 29);
  LogoBitmap.Canvas.LineTo(49, 34);
  LogoBitmap.Canvas.MoveTo(49, 53);
  LogoBitmap.Canvas.LineTo(49, 58);
  LogoBitmap.Canvas.MoveTo(35, 43);
  LogoBitmap.Canvas.LineTo(40, 43);
  LogoBitmap.Canvas.MoveTo(59, 43);
  LogoBitmap.Canvas.LineTo(64, 43);
  LogoBitmap.Canvas.MoveTo(39, 33);
  LogoBitmap.Canvas.LineTo(43, 37);
  LogoBitmap.Canvas.MoveTo(55, 49);
  LogoBitmap.Canvas.LineTo(59, 53);
  LogoBitmap.Canvas.MoveTo(39, 53);
  LogoBitmap.Canvas.LineTo(43, 49);
  LogoBitmap.Canvas.MoveTo(55, 37);
  LogoBitmap.Canvas.LineTo(59, 33);

  WizardForm.WizardSmallBitmapImage.Bitmap := LogoBitmap;
  WizardForm.WizardSmallBitmapImage.AutoSize := False;
  WizardForm.WizardSmallBitmapImage.Stretch := True;
  WizardForm.WizardSmallBitmapImage.BackColor := $001B2734;
  WizardForm.WizardSmallBitmapImage.Left := ScaleX(12);
  WizardForm.WizardSmallBitmapImage.Top := ScaleY(7);
  WizardForm.WizardSmallBitmapImage.Width := ScaleX(48);
  WizardForm.WizardSmallBitmapImage.Height := ScaleY(48);
  WizardForm.WizardSmallBitmapImage.Visible := True;

  WizardForm.PageNameLabel.Left := ScaleX(70);
  WizardForm.PageNameLabel.Top := ScaleY(7);
  WizardForm.PageNameLabel.Width := WizardForm.MainPanel.Width - ScaleX(82);
  WizardForm.PageNameLabel.Height := ScaleY(24);
  WizardForm.PageNameLabel.Font.Name := 'Segoe UI';
  WizardForm.PageNameLabel.Font.Size := 14;
  WizardForm.PageNameLabel.Font.Style := [fsBold];
  WizardForm.PageNameLabel.Font.Color := $00F2F5F8;

  WizardForm.PageDescriptionLabel.Left := ScaleX(70);
  WizardForm.PageDescriptionLabel.Top := ScaleY(31);
  WizardForm.PageDescriptionLabel.Width := WizardForm.MainPanel.Width - ScaleX(82);
  WizardForm.PageDescriptionLabel.Height := ScaleY(18);
  WizardForm.PageDescriptionLabel.Font.Name := 'Segoe UI';
  WizardForm.PageDescriptionLabel.Font.Size := 9;
  WizardForm.PageDescriptionLabel.Font.Color := $00B7C4D1;

  WizardForm.NextButton.Font.Name := 'Segoe UI';
  WizardForm.BackButton.Font.Name := 'Segoe UI';
  WizardForm.CancelButton.Font.Name := 'Segoe UI';

  ProgressPercentLabel := TNewStaticText.Create(WizardForm);
  ProgressPercentLabel.Parent := WizardForm.ProgressGauge.Parent;
  ProgressPercentLabel.Left := WizardForm.ProgressGauge.Left;
  ProgressPercentLabel.Top := WizardForm.ProgressGauge.Top + WizardForm.ProgressGauge.Height + ScaleY(6);
  ProgressPercentLabel.Width := ScaleX(100);
  ProgressPercentLabel.Height := ScaleY(20);
  ProgressPercentLabel.Caption := '0%';
  ProgressPercentLabel.Font.Name := 'Segoe UI';
  ProgressPercentLabel.Font.Size := 9;
  ProgressPercentLabel.Font.Color := clWhite;

  ModePage := CreateCustomPage(wpSelectDir, 'Выбор источника', 'Выберите источник, из которого необходимо скопировать программы.');
  CatalogPage := CreateCustomPage(ModePage.ID, 'Выбор компонентов', 'Выберите программы, которые вы хотите скопировать, затем нажмите «Далее».');
  ArchivePage := CreateCustomPage(CatalogPage.ID, 'Выбор архивов', 'Выберите архивы, которые вы хотите скопировать, затем нажмите «Далее».');
  ModePage.Surface.Color := $00131A23;
  CatalogPage.Surface.Color := $00131A23;
  ArchivePage.Surface.Color := $00131A23;

  { Две отдельные карточки выбора источника }
  ModeCardCatalog := TPanel.Create(ModePage);
  ModeCardCatalog.Parent := ModePage.Surface;
  ModeCardCatalog.Left := ScaleX(10);
  ModeCardCatalog.Top := ScaleY(16);
  ModeCardCatalog.Width := ModePage.SurfaceWidth - ScaleX(20);
  ModeCardCatalog.Height := ScaleY(64);
  ModeCardCatalog.Anchors := [akLeft, akTop, akRight];
  ModeCardCatalog.BevelOuter := bvNone;
  ModeCardCatalog.Color := $001E2B39;

  ModeCardArchive := TPanel.Create(ModePage);
  ModeCardArchive.Parent := ModePage.Surface;
  ModeCardArchive.Left := ScaleX(10);
  ModeCardArchive.Top := ScaleY(92);
  ModeCardArchive.Width := ModePage.SurfaceWidth - ScaleX(20);
  ModeCardArchive.Height := ScaleY(64);
  ModeCardArchive.Anchors := [akLeft, akTop, akRight];
  ModeCardArchive.BevelOuter := bvNone;
  ModeCardArchive.Color := $001E2B39;

  CatalogModeButton := TNewRadioButton.Create(ModePage);
  CatalogModeButton.Parent := ModeCardCatalog;
  CatalogModeButton.Left := ScaleX(16);
  CatalogModeButton.Top := ScaleY(16);
  CatalogModeButton.Width := ModeCardCatalog.Width - ScaleX(32);
  CatalogModeButton.Height := ScaleY(32);
  CatalogModeButton.Anchors := [akLeft, akTop, akRight];
  CatalogModeButton.Caption := 'Выбрать программу из каталога программ';
  CatalogModeButton.Checked := True;
  CatalogModeButton.Font.Name := 'Segoe UI';
  CatalogModeButton.Font.Size := 11;
  CatalogModeButton.Font.Style := [fsBold];
  CatalogModeButton.Font.Color := $00F0F4F8;
  CatalogModeButton.Color := ModeCardCatalog.Color;

  ArchiveModeButton := TNewRadioButton.Create(ModePage);
  ArchiveModeButton.Parent := ModeCardArchive;
  ArchiveModeButton.Left := ScaleX(16);
  ArchiveModeButton.Top := ScaleY(16);
  ArchiveModeButton.Width := ModeCardArchive.Width - ScaleX(32);
  ArchiveModeButton.Height := ScaleY(32);
  ArchiveModeButton.Anchors := [akLeft, akTop, akRight];
  ArchiveModeButton.Caption := 'Выбрать готовый архив с программами';
  ArchiveModeButton.Font.Name := 'Segoe UI';
  ArchiveModeButton.Font.Size := 11;
  ArchiveModeButton.Font.Style := [fsBold];
  ArchiveModeButton.Font.Color := $00F0F4F8;
  ArchiveModeButton.Color := ModeCardArchive.Color;

  { Каталог размещён на отдельной тёмной панели }
  CatalogCard := TPanel.Create(CatalogPage);
  CatalogCard.Parent := CatalogPage.Surface;
  CatalogCard.Left := ScaleX(8);
  CatalogCard.Top := ScaleY(8);
  CatalogCard.Width := CatalogPage.SurfaceWidth - ScaleX(16);
  CatalogCard.Height := CatalogPage.SurfaceHeight - ScaleY(16);
  CatalogCard.Anchors := [akLeft, akTop, akRight, akBottom];
  CatalogCard.BevelOuter := bvNone;
  CatalogCard.Color := $0019232D;

  CatalogList := TNewCheckListBox.Create(CatalogPage);
  CatalogList.Parent := CatalogCard;
  CatalogList.Left := ScaleX(10);
  CatalogList.Top := ScaleY(10);
  CatalogList.Width := CatalogCard.Width - ScaleX(20);
  CatalogList.Height := CatalogCard.Height - ScaleY(20);
  CatalogList.Anchors := [akLeft, akTop, akRight, akBottom];
  CatalogList.Flat := False;
  CatalogList.ShowLines := False;
  CatalogList.BorderStyle := bsNone;
  CatalogList.Color := $0019232D;
  CatalogList.MinItemHeight := ScaleY(28);
  CatalogList.Font.Name := 'Segoe UI';
  CatalogList.Font.Size := 10;
  CatalogList.Font.Color := $00E8EDF2;
  CatalogList.Font.Style := [];

  CatalogList.AddGroup('Портативные программы', '', 0, nil);
  AddCatalogCheck('p_adobe_acrobat', 'Adobe Acrobat Pro', 1, False, True);
  AddCatalogCheck('p_adobe_aftereffects', 'Adobe After Effects', 1, False, True);
  AddCatalogCheck('p_adobe_audition', 'Adobe Audition', 1, False, True);
  AddCatalogCheck('p_adobe_illustrator', 'Adobe Illustrator', 1, False, True);
  AddCatalogCheck('p_adobe_photoshop', 'Adobe Photoshop', 1, False, True);
  AddCatalogCheck('p_adobe_premiere', 'Adobe Premiere Pro', 1, False, True);
  AddCatalogCheck('p_aida64', 'AIDA64', 1, False, True);
  AddCatalogCheck('p_anydesk', 'AnyDesk', 1, False, True);
  AddCatalogCheck('p_blender', 'Blender', 1, False, True);
  AddCatalogCheck('p_easy2boot', 'Easy2Boot', 1, False, True);
  AddCatalogCheck('p_encryptonclick', 'EncryptOnClick', 1, False, True);
  AddCatalogCheck('p_chrome', 'Google Chrome', 1, False, True);
  AddCatalogCheck('p_imgburn', 'ImgBurn', 1, False, True);
  AddCatalogCheck('p_localsend', 'LocalSend', 1, False, True);
  AddCatalogCheck('p_scanner', 'Microsoft Scanner', 1, False, True);
  AddCatalogCheck('p_nsis', 'NSIS', 1, False, True);
  AddCatalogCheck('p_obs', 'OBS Studio', 1, False, True);
  AddCatalogCheck('p_portablecreator', 'Portable Creator', 1, False, True);
  AddCatalogCheck('p_putty', 'PuTTY', 1, False, True);
  AddCatalogCheck('p_rufus', 'Rufus', 1, False, True);
  AddCatalogCheck('p_sysinternals', 'Sysinternals Suite', 1, False, True);
  AddCatalogCheck('p_utorrent', 'µTorrent', 1, False, True);
  AddCatalogCheck('p_vlc', 'VLC Media Player', 1, False, True);
  AddCatalogCheck('p_vscode', 'Visual Studio Code', 1, False, True);
  AddCatalogCheck('p_wifiinfoview', 'WifiInfoView', 1, False, True);
  AddCatalogCheck('p_winnote', 'WinNotepad', 1, False, True);
  AddCatalogCheck('p_winpowershell', 'WinPowerShell', 1, False, True);
  AddCatalogCheck('p_winrar', 'WinRAR', 1, False, True);
  AddCatalogCheck('p_winscp', 'WinSCP', 1, False, True);
  AddCatalogCheck('p_winsetup', 'WinSetupFromUSB', 1, False, True);
  AddCatalogCheck('p_winterminal', 'Windows Terminal', 1, False, True);
  AddCatalogCheck('p_wnetwatcher', 'WNetWatcher', 1, False, True);
  CatalogList.AddGroup('Установщики программ', '', 0, nil);
  AddCatalogCheck('s_adobe_acrobat', 'Adobe Acrobat Pro', 1, False, True);
  AddCatalogCheck('s_adobe_aftereffects', 'Adobe After Effects', 1, False, True);
  AddCatalogCheck('s_adobe_animate', 'Adobe Animate', 1, False, True);
  AddCatalogCheck('s_adobe_audition', 'Adobe Audition', 1, False, True);
  AddCatalogCheck('s_adobe_lightroom', 'Adobe Lightroom Classic', 1, False, True);
  AddCatalogCheck('s_adobe_substance', 'Adobe Substance 3D Painter', 1, False, True);
  AddCatalogCheck('s_aida64', 'AIDA 64', 1, False, True);
  AddCatalogCheck('s_blender', 'Blender 3D', 1, False, True);
  AddCatalogCheck('s_discord', 'Discord', 1, False, True);
  AddCatalogCheck('s_epic', 'Epic Games', 1, False, True);
  AddCatalogCheck('s_flstudio', 'FL Studio', 1, False, True);
  AddCatalogCheck('s_illustrator', 'Adobe Illustrator', 1, False, True);
  AddCatalogCheck('s_indesign', 'Adobe InDesign', 1, False, True);
  AddCatalogCheck('s_localsend', 'LocalSend', 1, False, True);
  AddCatalogCheck('s_office', 'Microsoft Office', 1, False, True);
  AddCatalogCheck('s_obs', 'OBS Studio', 1, False, True);
  AddCatalogCheck('s_photoshop', 'Adobe Photoshop', 1, False, True);
  AddCatalogCheck('s_premier', 'Adobe Premiere Pro', 1, False, True);
  AddCatalogCheck('s_steam', 'Steam', 1, False, True);
  AddCatalogCheck('s_torrent', 'Torrent', 1, False, True);
  AddCatalogCheck('s_winrar', 'WinRAR', 1, False, True);
  AddCatalogCheck('s_vs_all', 'Visual Studio (and Code version)', 1, True, True);
  AddCatalogCheck('s_vs_vs', 'Visual Studio', 2, False, True);
  AddCatalogCheck('s_vs_code', 'Visual Studio Code', 2, False, True);
  AddCatalogCheck('s_browsers_all', 'Браузеры (все сразу)', 1, True, True);
  AddCatalogCheck('s_browser_chrome', 'Google Chrome', 2, False, True);
  AddCatalogCheck('s_browser_firefox', 'Mozilla Firefox', 2, False, True);
  AddCatalogCheck('s_browser_edge', 'Microsoft Edge', 2, False, True);
  AddCatalogCheck('s_browser_opera', 'Opera', 2, False, True);
  AddCatalogCheck('s_browser_yandex', 'Яндекс Браузер', 2, False, True);
  ArchiveCard := TPanel.Create(ArchivePage);
  ArchiveCard.Parent := ArchivePage.Surface;
  ArchiveCard.Left := ScaleX(8);
  ArchiveCard.Top := ScaleY(8);
  ArchiveCard.Width := ArchivePage.SurfaceWidth - ScaleX(16);
  ArchiveCard.Height := ScaleY(132);
  ArchiveCard.Anchors := [akLeft, akTop, akRight];
  ArchiveCard.BevelOuter := bvNone;
  ArchiveCard.Color := $0019232D;

  ArchiveList := TNewCheckListBox.Create(ArchivePage);
  ArchiveList.Parent := ArchiveCard;
  ArchiveList.Left := ScaleX(10);
  ArchiveList.Top := ScaleY(10);
  ArchiveList.Width := ArchiveCard.Width - ScaleX(20);
  ArchiveList.Height := ArchiveCard.Height - ScaleY(20);
  ArchiveList.Anchors := [akLeft, akTop, akRight, akBottom];
  ArchiveList.Flat := False;
  ArchiveList.BorderStyle := bsNone;
  ArchiveList.Color := $0019232D;
  ArchiveList.MinItemHeight := ScaleY(42);
  ArchiveList.Font.Name := 'Segoe UI';
  ArchiveList.Font.Size := 11;
  ArchiveList.Font.Color := $00E8EDF2;
  ArchiveList.Font.Style := [];
  ArchiveList.AddCheckBox('Софт-Portable.rar', '', 0, False, True, False, False, nil);
  ArchiveList.AddCheckBox('Софт-SetUp.rar', '', 0, False, True, False, False, nil);

end;

function ShouldSkipPage(PageID: Integer): Boolean;
begin
  Result := False;
  if (PageID = wpWelcome) or
     (PageID = wpSelectComponents) or (PageID = wpSelectProgramGroup) then
    Result := True;
  if (PageID = CatalogPage.ID) and ArchiveModeButton.Checked then
    Result := True;
  if (PageID = ArchivePage.ID) and CatalogModeButton.Checked then
    Result := True;
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := True;
  if CurPageID = CatalogPage.ID then
  begin
    if not HasAnyCatalogSelection then
    begin
      MsgBox('Выберите хотя бы одну программу для копирования.', mbInformation, MB_OK);
      Result := False;
    end;
  end
  else if CurPageID = ArchivePage.ID then
  begin
    if not (ArchiveList.Checked[0] or ArchiveList.Checked[1]) then
    begin
      MsgBox('Выберите хотя бы один архив для копирования.', mbInformation, MB_OK);
      Result := False;
    end;
  end;
end;

procedure CurInstallProgressChanged(CurProgress, MaxProgress: Integer);
var
  PercentValue: Integer;
begin
  if MaxProgress > 0 then
  begin
    PercentValue := Round(CurProgress * 100.0 / MaxProgress);
    if PercentValue < 0 then
      PercentValue := 0;
    if PercentValue > 100 then
      PercentValue := 100;
    ProgressPercentLabel.Caption := IntToStr(PercentValue) + '%';
  end
  else
    ProgressPercentLabel.Caption := '0%';
end;

function InitializeSetup(): Boolean;
begin
  Result := True;
end;


