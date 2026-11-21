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

OutputDir=E:\для всего\MySoft\Output
OutputBaseFilename=SoftSetup

Compression=lzma2/normal
SolidCompression=yes

DiskSpanning=yes
DiskSliceSize=9000000000

WizardStyle=modern dark
WizardSizePercent=100

SetupIconFile=E:\для всего\MySoft\app.ico
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

[Messages]
SetupWindowTitle=Установка - Софт

WelcomeLabel1=Добро пожаловать!
WelcomeLabel2=Перед вами мастер установки программной коллекции «Софт».%n%nВ сборник включены программы для работы, настройки компьютера и повседневных задач.%n%nМастер поможет установить необходимые файлы на ваш компьютер. Исходная структура каталогов будет сохранена.%n%nПеред продолжением рекомендуется закрыть работающие программы и выбрать подходящий каталог для установки.%n%nНажмите «Далее», чтобы продолжить.

SelectDirLabel3=Выберите папку, в которую будет установлена коллекция.%n%nПо умолчанию используется каталог Program Files. При необходимости вы можете выбрать другое расположение.%n%nДля продолжения нажмите «Далее».

ReadyLabel1=Подготовка завершена
ReadyLabel2=Все параметры установки настроены.%n%nПосле нажатия кнопки «Установить» начнётся копирование файлов в выбранный каталог.%n%nПродолжительность процесса зависит от скорости накопителя и производительности компьютера.%n%nПроверьте выбранные параметры и нажмите «Установить».

InstallingLabel=Выполняется установка. Пожалуйста, дождитесь завершения процесса.

StatusExtractFiles=Копирование файлов: {0}
StatusCreateDirs=Создание каталогов: {0}
StatusRegisterFiles=Обработка файлов: {0}

FinishedHeadingLabel=Установка завершена
FinishedLabel=Программная коллекция «Софт» успешно установлена.%n%nВсе файлы размещены в выбранном каталоге. Теперь вы можете открыть папку установки и приступить к работе.%n%nСпасибо за использование коллекции!

[Files]
Source: "E:\для всего\MySoft\app.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\для всего\MySoft\Cофт\*"; DestDir: "{app}"; Flags: recursesubdirs createallsubdirs ignoreversion

[Code]
procedure InitializeWizard();
begin
  WizardForm.DiskSpaceLabel.Visible := False;
end;
