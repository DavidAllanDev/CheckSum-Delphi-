unit ChkSm;

interface

uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg,
  IdSASL, IdSASLUserPass, IdSASL_CRAMBase,
  IdSASL_CRAM_MD5, IdBaseComponent, Vcl.FileCtrl;

type
  TFChkSm = class(TForm)
    lbl_fileName: TLabel;
    lbl_file: TLabel;
    SUM: TLabel;
    lbl_sum: TLabel;
    OpenDialog: TOpenDialog;
    OpenButton: TSpeedButton;
    FileListBox: TFileListBox;
    IdSASLCRAMMD5: TIdSASLCRAMMD5;
    edt_sum: TEdit;
    procedure OpenButtonClick(Sender: TObject);
    procedure CheckSumA(const Data: String; out BCC1, BCC2: Byte);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FChkSm: TFChkSm;

implementation

uses
  Windows;

{$R *.dfm}

procedure TFChkSm.OpenButtonClick(Sender: TObject);
var
  TS: TStringList;
  B1, B2:Byte;
begin
  B1 := 0;
  B2 := 0;

  OpenDialog.Execute();

  lbl_file.Caption :=  OpenDialog.FileName;

  if (FileExists(lbl_file.Caption)) then begin
    FileListBox.ApplyFilePath(lbl_file.Caption);

    TS := TStringList.Create;

    TS.LoadFromFile(lbl_file.Caption);

    CheckSumA(TS.Text,B1,B2);

    lbl_sum.Caption := IntToStr(B1)+'-'+IntToStr(B2);

    lbl_sum.Caption := IdSASLCRAMMD5.BuildKeydAuth(TS.Text,IntToStr(Length(TS.Text)
                                          *Length(lbl_file.Caption)
                                          *(GetFileSize(StrLen(PChar(lbl_file.Caption)),Self))));

    edt_sum.Text := lbl_sum.Caption +':_:'+ IntToStr(GetFileVersion(lbl_file.Caption));
  end;

end;

procedure TFChkSm.CheckSumA(const Data: String; out BCC1, BCC2: Byte);
var
  I: Integer;
begin
  BCC1 := 0;
  BCC2 := 0;

  for I := 1 to Length(Data) do begin
    Inc(BCC1, Ord(Data[I]));

    BCC2 := BCC2 xor Ord(Data[I]);

  end;

  BCC1 := -BCC1;
end;

end.
