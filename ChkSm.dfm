object FChkSm: TFChkSm
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'CheckSum Tool'
  ClientHeight = 218
  ClientWidth = 487
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_fileName: TLabel
    Left = 4
    Top = 69
    Width = 20
    Height = 13
    Caption = 'File:'
  end
  object lbl_file: TLabel
    Left = 52
    Top = 69
    Width = 3
    Height = 13
  end
  object SUM: TLabel
    Left = 4
    Top = 25
    Width = 25
    Height = 13
    Caption = 'SUM:'
  end
  object lbl_sum: TLabel
    Left = 60
    Top = 25
    Width = 3
    Height = 13
  end
  object OpenButton: TSpeedButton
    Left = 4
    Top = 88
    Width = 51
    Height = 22
    Caption = '&Open...'
    OnClick = OpenButtonClick
  end
  object FileListBox: TFileListBox
    Left = 72
    Top = 91
    Width = 289
    Height = 69
    ItemHeight = 13
    Mask = '*.exe'
    TabOrder = 0
  end
  object edt_sum: TEdit
    Left = 4
    Top = 44
    Width = 373
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object OpenDialog: TOpenDialog
    Filter = '*.exe|*.exe'
    OptionsEx = [ofExNoPlacesBar]
    Left = 408
    Top = 106
  end
  object IdSASLCRAMMD5: TIdSASLCRAMMD5
    Left = 408
    Top = 56
  end
end
