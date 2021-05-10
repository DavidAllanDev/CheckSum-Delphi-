program CheckSum;

uses
  Forms,
  ChkSm in 'ChkSm.pas' {FChkSm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFChkSm, FChkSm);
  Application.Run;
end.
