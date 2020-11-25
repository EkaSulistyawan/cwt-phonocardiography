object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 656
  ClientWidth = 795
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 605
    Top = 24
    Width = 184
    Height = 317
    Caption = 'GroupBox1'
    TabOrder = 0
    object Button1: TButton
      Left = 16
      Top = 204
      Width = 153
      Height = 25
      Caption = 'Input Data'
      TabOrder = 0
      OnClick = Button1Click
    end
    object GroupBox4: TGroupBox
      Left = 19
      Top = 24
      Width = 150
      Height = 174
      Caption = 'GroupBox4'
      TabOrder = 1
      object Edit2: TEdit
        Left = 11
        Top = 87
        Width = 121
        Height = 21
        TabOrder = 0
        Text = '75'
      end
      object Edit3: TEdit
        Left = 11
        Top = 114
        Width = 121
        Height = 21
        TabOrder = 1
        Text = '20'
      end
      object Edit4: TEdit
        Left = 11
        Top = 141
        Width = 121
        Height = 21
        TabOrder = 2
        Text = '250'
      end
      object Edit1: TEdit
        Left = 11
        Top = 60
        Width = 121
        Height = 21
        TabOrder = 3
        Text = '11025'
      end
      object ComboBox1: TComboBox
        Left = 11
        Top = 33
        Width = 94
        Height = 21
        TabOrder = 4
        Text = 'ComboBox1'
      end
    end
    object Edit11: TEdit
      Left = 16
      Top = 251
      Width = 121
      Height = 21
      TabOrder = 2
      TextHint = 'Banyak Data'
    end
    object Edit12: TEdit
      Left = 16
      Top = 278
      Width = 121
      Height = 21
      TabOrder = 3
      TextHint = 'FS'
    end
  end
  object GroupBox2: TGroupBox
    Left = 605
    Top = 347
    Width = 184
    Height = 301
    Caption = 'GroupBox2'
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 10
      Height = 13
      Caption = 'W'
    end
    object Label2: TLabel
      Left = 16
      Top = 111
      Width = 49
      Height = 13
      Caption = 'Start Pixel'
    end
    object Label3: TLabel
      Left = 16
      Top = 157
      Width = 35
      Height = 13
      Caption = 'delta_s'
    end
    object Edit5: TEdit
      Left = 34
      Top = 24
      Width = 143
      Height = 21
      TabOrder = 0
      Text = '5.336'
    end
    object Edit8: TEdit
      Left = 16
      Top = 130
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '1'
    end
    object Edit9: TEdit
      Left = 16
      Top = 176
      Width = 121
      Height = 21
      TabOrder = 2
      Text = '10000'
    end
    object Button3: TButton
      Left = 16
      Top = 51
      Width = 161
      Height = 25
      Caption = 'Morlet'
      TabOrder = 3
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 16
      Top = 267
      Width = 153
      Height = 31
      Caption = 'CWT'
      TabOrder = 4
      OnClick = Button4Click
    end
    object Edit10: TEdit
      Left = 16
      Top = 82
      Width = 161
      Height = 21
      TabOrder = 5
      Text = '200'
      TextHint = 'Banyak Skala'
    end
    object Edit6: TEdit
      Left = 16
      Top = 240
      Width = 153
      Height = 21
      TabOrder = 6
      Text = 'Edit6'
    end
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 591
    Height = 640
    ActivePage = TabSheet4
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Input_BPF'
      object Chart1: TChart
        Left = 14
        Top = 48
        Width = 566
        Height = 198
        Legend.CheckBoxes = True
        Title.Text.Strings = (
          'Sinyal Input')
        BottomAxis.Title.Caption = 'waktu'
        LeftAxis.Title.Caption = 'Amplitudo'
        View3D = False
        TabOrder = 0
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object Series1: TLineSeries
          Brush.BackColor = clDefault
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
        end
        object Series2: TLineSeries
          Brush.BackColor = clDefault
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
        end
      end
      object Chart3: TChart
        Left = 14
        Top = 252
        Width = 566
        Height = 214
        Title.Text.Strings = (
          'BPF')
        BottomAxis.Title.Caption = 'waktu'
        LeftAxis.Title.Caption = 'amplitudo'
        View3D = False
        TabOrder = 1
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object Series4: TLineSeries
          Brush.BackColor = clDefault
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
        end
      end
      object GroupBox6: TGroupBox
        Left = 14
        Top = 3
        Width = 307
        Height = 39
        Caption = 'GroupBox6'
        TabOrder = 2
        object RadioButton1: TRadioButton
          Left = 16
          Top = 16
          Width = 113
          Height = 17
          Caption = 'BPF Only'
          TabOrder = 0
        end
        object RadioButton2: TRadioButton
          Left = 120
          Top = 15
          Width = 169
          Height = 17
          Caption = 'With DWT'
          Checked = True
          TabOrder = 1
          TabStop = True
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'DWT'
      ImageIndex = 4
      object ScrollBox2: TScrollBox
        Left = 3
        Top = 16
        Width = 577
        Height = 593
        HorzScrollBar.Position = 14
        VertScrollBar.Position = 709
        TabOrder = 0
        object Chart6: TChart
          Left = -11
          Top = -700
          Width = 567
          Height = 250
          Title.Text.Strings = (
            'TChart')
          View3D = False
          TabOrder = 0
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 13
          object Series10: TLineSeries
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
        end
        object Chart7: TChart
          Left = -11
          Top = -444
          Width = 567
          Height = 250
          Title.Text.Strings = (
            'TChart')
          View3D = False
          TabOrder = 1
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 13
          object Series11: TLineSeries
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
        end
        object Chart8: TChart
          Left = -11
          Top = -188
          Width = 564
          Height = 250
          Title.Text.Strings = (
            'TChart')
          View3D = False
          TabOrder = 2
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 13
          object Series12: TLineSeries
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
        end
        object Chart9: TChart
          Left = -11
          Top = 68
          Width = 564
          Height = 250
          Title.Text.Strings = (
            'Skala 4')
          BottomAxis.Title.Caption = 'Waktu'
          LeftAxis.Title.Caption = 'Amplitudo'
          View3D = False
          TabOrder = 3
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 13
          object Series13: TLineSeries
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
        end
        object Chart10: TChart
          Left = -11
          Top = 324
          Width = 564
          Height = 250
          Title.Text.Strings = (
            'Skala 5')
          View3D = False
          TabOrder = 4
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 13
          object Series14: TLineSeries
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Shanon'
      ImageIndex = 3
      object Button2: TButton
        Left = 3
        Top = 3
        Width = 142
        Height = 25
        Caption = 'Average Shanon'
        TabOrder = 0
        OnClick = Button2Click
      end
      object Chart4: TChart
        Left = 3
        Top = 42
        Width = 566
        Height = 250
        Legend.CheckBoxes = True
        Title.Text.Strings = (
          'Sinyal X Shanon Env.')
        BottomAxis.Title.Caption = 'Waktu'
        LeftAxis.Title.Caption = 'Amplitudo'
        View3D = False
        TabOrder = 1
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object Series5: TLineSeries
          Brush.BackColor = clDefault
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
        end
        object Series6: TLineSeries
          SeriesColor = clRed
          Brush.BackColor = clDefault
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
        end
        object Series7: TLineSeries
          Brush.BackColor = clDefault
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
        end
        object Series8: TLineSeries
          SeriesColor = clRed
          Brush.BackColor = clDefault
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
        end
      end
      object Button8: TButton
        Left = 319
        Top = 3
        Width = 146
        Height = 25
        Caption = 'Thresholding'
        TabOrder = 2
        OnClick = Button8Click
      end
      object Edit7: TEdit
        Left = 192
        Top = 3
        Width = 121
        Height = 21
        TabOrder = 3
        TextHint = 'Cenv'
      end
      object ListBox1: TListBox
        Left = 3
        Top = 298
        Width = 287
        Height = 311
        ItemHeight = 13
        TabOrder = 4
      end
      object Chart5: TChart
        Left = 296
        Top = 298
        Width = 273
        Height = 214
        Legend.Visible = False
        Title.Text.Strings = (
          'Pemotongan')
        BottomAxis.Title.Caption = 'waktu'
        LeftAxis.Title.Caption = 'Amplitudo'
        View3D = False
        TabOrder = 5
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object Series9: TLineSeries
          Brush.BackColor = clDefault
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
        end
      end
      object GroupBox5: TGroupBox
        Left = 296
        Top = 518
        Width = 273
        Height = 91
        Caption = 'GroupBox5'
        TabOrder = 6
        object Edit13: TEdit
          Left = 19
          Top = 24
          Width = 75
          Height = 21
          TabOrder = 0
          TextHint = 'Start'
        end
        object Edit14: TEdit
          Left = 19
          Top = 51
          Width = 75
          Height = 21
          TabOrder = 1
          TextHint = 'Stop'
        end
        object Button9: TButton
          Left = 144
          Top = 16
          Width = 116
          Height = 72
          Caption = 'Cut Data'
          TabOrder = 2
          OnClick = Button9Click
        end
        object Edit15: TEdit
          Left = 114
          Top = 24
          Width = 24
          Height = 21
          TabOrder = 3
          Text = '1'
          TextHint = 'Downsampling Point'
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'CWT'
      ImageIndex = 2
      object Label9: TLabel
        Left = 84
        Top = 534
        Width = 31
        Height = 13
        Caption = 'Label9'
      end
      object Label10: TLabel
        Left = 416
        Top = 549
        Width = 31
        Height = 13
        Caption = 'Waktu'
      end
      object Label11: TLabel
        Left = 416
        Top = 573
        Width = 25
        Height = 13
        Caption = 'Skala'
      end
      object Label4: TLabel
        Left = 84
        Top = 517
        Width = 31
        Height = 13
        Caption = 'Label4'
      end
      object ScrollBox1: TScrollBox
        Left = 3
        Top = 3
        Width = 566
        Height = 463
        VertScrollBar.Position = 64
        TabOrder = 0
        object Image1: TImage
          Left = 52
          Top = 141
          Width = 500
          Height = 200
          OnClick = Image1Click
          OnMouseMove = Image1MouseMove
        end
        object Label6: TLabel
          Left = 42
          Top = 429
          Width = 31
          Height = 13
          Caption = 'Label6'
        end
        object Label5: TLabel
          Left = 5
          Top = 429
          Width = 31
          Height = 13
          Caption = 'Label5'
        end
        object Label7: TLabel
          Left = 5
          Top = 410
          Width = 31
          Height = 13
          Caption = 'Label7'
        end
        object Label8: TLabel
          Left = 42
          Top = 410
          Width = 31
          Height = 13
          Caption = 'Label8'
        end
        object Button11: TButton
          Left = 79
          Top = 407
          Width = 75
          Height = 35
          Caption = 'Reset'
          TabOrder = 0
          OnClick = Button11Click
        end
        object Chart11: TChart
          Left = 32
          Top = -47
          Width = 534
          Height = 182
          Legend.Visible = False
          Title.Text.Strings = (
            'Time Domain')
          BottomAxis.Title.Caption = '%time'
          LeftAxis.Title.Caption = 'Amplitude'
          LeftAxis.Visible = False
          View3D = False
          TabOrder = 1
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 13
          object Series15: TLineSeries
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object Series16: TLineSeries
            SeriesColor = clRed
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
        end
      end
      object Button7: TButton
        Left = 3
        Top = 491
        Width = 75
        Height = 25
        Caption = 'Extract Data'
        TabOrder = 1
        OnClick = Button7Click
      end
      object ScrollBar1: TScrollBar
        Left = 84
        Top = 491
        Width = 389
        Height = 17
        Max = 99
        PageSize = 0
        TabOrder = 2
        OnChange = ScrollBar1Change
      end
      object Button10: TButton
        Left = 3
        Top = 522
        Width = 75
        Height = 25
        Caption = 'Batas'
        TabOrder = 3
        OnClick = Button10Click
      end
      object ListBox2: TListBox
        Left = 3
        Top = 553
        Width = 109
        Height = 41
        ItemHeight = 13
        TabOrder = 4
      end
      object Edit16: TEdit
        Left = 459
        Top = 546
        Width = 121
        Height = 21
        TabOrder = 5
        Text = 'Edit16'
      end
      object Edit17: TEdit
        Left = 459
        Top = 573
        Width = 121
        Height = 21
        TabOrder = 6
        Text = 'Edit17'
      end
      object Edit18: TEdit
        Left = 479
        Top = 491
        Width = 75
        Height = 21
        TabOrder = 7
        Text = 'Edit18'
      end
      object Edit19: TEdit
        Left = 479
        Top = 518
        Width = 78
        Height = 21
        TabOrder = 8
        Text = 'Edit19'
      end
      object Button12: TButton
        Left = 398
        Top = 518
        Width = 75
        Height = 25
        Caption = 'CCog'
        TabOrder = 9
        OnClick = Button12Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      object Button6: TButton
        Left = 3
        Top = 3
        Width = 75
        Height = 25
        Caption = 'Button6'
        TabOrder = 0
        OnClick = Button6Click
      end
      object Chart2: TChart
        Left = 3
        Top = 34
        Width = 577
        Height = 250
        Legend.Visible = False
        Title.Text.Strings = (
          'TChart')
        View3D = False
        TabOrder = 1
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object Series3: TLineSeries
          Brush.BackColor = clDefault
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
        end
      end
      object GroupBox3: TGroupBox
        Left = 14
        Top = 296
        Width = 185
        Height = 64
        Caption = 'GroupBox3'
        TabOrder = 2
        object Button5: TButton
          Left = 14
          Top = 24
          Width = 155
          Height = 33
          Caption = 'Convert to BMP'
          TabOrder = 0
          OnClick = Button5Click
        end
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 647
    Top = 543
  end
  object OpenDialog2: TOpenDialog
    Left = 752
    Top = 40
  end
end
