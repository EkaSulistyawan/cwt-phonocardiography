unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, Vcl.StdCtrls,
  VCLTee.TeEngine, VCLTee.Series, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, Math,
  Vcl.ComCtrls;

type
  myArray = array[-20..100000]of real;
  pArray = ^myArray;
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    GroupBox2: TGroupBox;
    Edit5: TEdit;
    Label1: TLabel;
    Edit8: TEdit;
    Edit9: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Button3: TButton;
    Button4: TButton;
    OpenDialog1: TOpenDialog;
    GroupBox4: TGroupBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit1: TEdit;
    OpenDialog2: TOpenDialog;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Chart1: TChart;
    Series1: TLineSeries;
    TabSheet2: TTabSheet;
    Button6: TButton;
    Chart2: TChart;
    Series3: TLineSeries;
    TabSheet3: TTabSheet;
    ScrollBox1: TScrollBox;
    Button7: TButton;
    Image1: TImage;
    ScrollBar1: TScrollBar;
    Edit6: TEdit;
    ComboBox1: TComboBox;
    GroupBox3: TGroupBox;
    Button5: TButton;
    Chart3: TChart;
    Series4: TLineSeries;
    Series2: TLineSeries;
    TabSheet4: TTabSheet;
    Button2: TButton;
    Chart4: TChart;
    Series5: TLineSeries;
    Series6: TLineSeries;
    Button8: TButton;
    Edit7: TEdit;
    Series7: TLineSeries;
    ListBox1: TListBox;
    Series8: TLineSeries;
    Chart5: TChart;
    Series9: TLineSeries;
    GroupBox5: TGroupBox;
    Edit13: TEdit;
    Edit14: TEdit;
    Button9: TButton;
    TabSheet5: TTabSheet;
    ScrollBox2: TScrollBox;
    Chart6: TChart;
    Series10: TLineSeries;
    Chart7: TChart;
    Series11: TLineSeries;
    Chart8: TChart;
    Series12: TLineSeries;
    Chart9: TChart;
    Series13: TLineSeries;
    Chart10: TChart;
    Series14: TLineSeries;
    GroupBox6: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit15: TEdit;
    Button10: TButton;
    ListBox2: TListBox;
    Label6: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Button11: TButton;
    Label9: TLabel;
    Chart11: TChart;
    Series15: TLineSeries;
    Edit16: TEdit;
    Label10: TLabel;
    Edit17: TEdit;
    Label11: TLabel;
    Label4: TLabel;
    Edit18: TEdit;
    Edit19: TEdit;
    Button12: TButton;
    Series16: TLineSeries;
    Function MotherWavelet(inTime : real; inTeta : real;stringType, stringOut : string):real;
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    PROCEDURE WavelengthToRGB(CONST Wavelength:  double);
    procedure Button5Click(Sender: TObject);
    procedure datauji();
    procedure Button1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure dft(data:pArray;localN:integer);
    procedure Button7Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Type1;
    procedure Type2;
    procedure bpf;
    procedure DWT;
    procedure Button2Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  data,cutData : myArray;
  y1,y2,a1,a2,d1 : myarray; //bpf
  fs,cmax : real;
  banyakData,banyakSkala : integer;
  R,G,B : byte;
  DFT_OUT : myarray;
  dataCWT : array[0..100000,0..1000]of real;
  maxCWT, minCWT : real;
  gTrigger : boolean;

  //  shanon
  pmax,pmin : real;


implementation

{$R *.dfm}

PROCEDURE TForm1.WavelengthToRGB(CONST Wavelength:  double);

   CONST
     Gamma        =   0.80;
     IntensityMax = 255;

   VAR
     Blue  :  DOUBLE;
     factor:  DOUBLE;
     Green :  DOUBLE;
     Red   :  DOUBLE;

   FUNCTION Adjust(CONST Color, Factor:  DOUBLE):  INTEGER;
   BEGIN
     IF   Color = 0.0
     THEN RESULT := 0     // Don't want 0^x = 1 for x <> 0
     ELSE RESULT := ROUND(IntensityMax * Power(Color * Factor, Gamma))
   END {Adjust};

 BEGIN

   CASE TRUNC(Wavelength) OF
     380..439:
       BEGIN
         Red   := -(Wavelength - 440) / (440 - 380);
         Green := 0.0;
         Blue  := 1.0
       END;

     440..489:
       BEGIN
         Red   := 0.0;
         Green := (Wavelength - 440) / (490 - 440);
         Blue  := 1.0
       END;

     490..509:
       BEGIN
         Red   := 0.0;
         Green := 1.0;
         Blue  := -(Wavelength - 510) / (510 - 490)
       END;

     510..579:
       BEGIN
         Red   := (Wavelength - 510) / (580 - 510);
         Green := 1.0;
         Blue  := 0.0
       END;

     580..644:
       BEGIN
         Red   := 1.0;
         Green := -(Wavelength - 645) / (645 - 580);
         Blue  := 0.0
       END;

     645..780:
       BEGIN
         Red   := 1.0;
         Green := 0.0;
         Blue  := 0.0
       END;

     ELSE
       Red   := 0.0;
       Green := 0.0;
       Blue  := 0.0
   END;

   // Let the intensity fall off near the vision limits
   CASE TRUNC(Wavelength) OF
     380..419:  factor := 0.3 + 0.7*(Wavelength - 380) / (420 - 380);
     420..700:  factor := 1.0;
     701..780:  factor := 0.3 + 0.7*(780 - Wavelength) / (780 - 700)
     ELSE       factor := 0.0
   END;

   R := Adjust(Red,   Factor);
   G := Adjust(Green, Factor);
   B := Adjust(Blue,  Factor)
 END {WavelengthToRGB};

procedure TForm1.datauji();
var
  I: Integer;
  f1,f2,f3 : real;
begin
  series1.Clear;
  banyakData := 200;
  fs  := strtofloat(edit1.Text);
  edit12.Text := floattostr(fs);
  edit11.Text := inttostr(banyakData);
  f1  := strtofloat(edit2.Text);
  f2  := strtofloat(edit3.Text);
  f3  := strtofloat(edit4.Text);
  // frekuensi 1
  for I := 0 to 66 do begin
    data[I] := sin (2*pi*f1*i/fs);
    series1.AddXY(i/fs,data[i]);
  end;
  // frekuensi 2
  for I := 67 to 127 do begin
    data[I] := sin (2*pi*f2*i/fs);
    series1.AddXY(i/fs,data[i]);
  end;
  // frekuensi 3
  for I := 128 to 200 do begin
    data[I] := sin (2*pi*f3*i/fs);
    series1.AddXY(i/fs,data[i]);
  end;
end;

procedure TForm1.Type1;
var
  tfile : TextFile;
  i,j,pt : integer;
  dump : real;
begin
  pt := 1;
    //  openfile
    if opendialog1.Execute then begin
      //  assign file
      AssignFile(tfile,opendialog1.FileName);
      reset(tfile);
      i := 0;
      j := 0;
      while not eof(tfile) do begin
        //  down sampling
        if (i mod pt = 0) then begin
          readln(tfile,dump,data[j]);
          //  cari fs (kasus data 2 kolom)
          if j=0 then fs := dump
          else if j=1 then fs := 1/(dump-fs);

          inc(j);
        end
        else readln(tfile,dump,dump);
        inc(i);
      end;

      banyakdata := j;
      edit11.Text := inttostr(banyakData);
      edit12.Text := floattostr(fs);
      //  plot
      for i := 0 to banyakData-1 do series1.AddXY(i/fs,data[i]);

    end;

    //close file
    CloseFile(tfile);
end;

procedure TForm1.Type2;
var
  tfile : TextFile;
  i,j,pt : integer;
  dump : real;
begin
  pt := 1;
    //  openfile
    if opendialog1.Execute then begin
      //  assign file
      AssignFile(tfile,opendialog1.FileName);
      reset(tfile);
      i := 0;
      j := 0;
      readln(tfile,fs);
      while not eof(tfile) do begin
        //  down sampling
        if (i mod pt = 0) then begin
          readln(tfile,data[j]);
          inc(j);
        end
        else readln(tfile,dump,dump);
        inc(i);
      end;

      banyakdata := j;
      edit11.Text := inttostr(banyakData);
      edit12.Text := floattostr(fs);
      //  plot
      for i := 0 to banyakData-1 do series1.AddXY(i/fs,data[i]);

    end;

    //close file
    CloseFile(tfile);
end;

procedure TForm1.Button10Click(Sender: TObject);
var
  s,n: Integer;
  tmin,tmax : integer;
  smin,smax : integer;
  tBatas,sBatas : integer;
  tStart,sStart : integer;
  tempMin,tempMax : integer;
  thr,localMax : real;
  bitmap : TBitmap;
  tsum, sSum, tsSum : real;
  tcog,scog : real;
begin
  //  tentukan nilai THR
  thr := strtofloat(label4.Caption);

  //  tentukan Max
  tBatas := strtoint(label5.Caption);
  sBatas := strtoint(label6.Caption);
  tStart := strtoint(label7.Caption);
  sStart := strtoint(label8.Caption);
  //  scan dari kiri kanan untuk tiap bawah ke atas

  tmin := tBatas;
  tempMin :=tBatas;
  tempMax := 0;
  tmax := 0;

  //  cari batas waktu
  s := sStart;
  while s < sBatas do begin
    n := tStart;

    //  hitung dari gadapet sampai dapet;
    while (dataCWT[n,s] < thr)AND(n < tBatas) do inc(n);
    if (n <> tBatas) then begin
      tempMin := n;
      while (dataCWT[n,s] > thr) AND (n < tBatas) do inc(n);
      if (n <> tBatas) then tempMax := n;
    end
    else tempMax := 0;

    //  jika
    if(tempMin < tMin) then tMin := tempMin;
    if (tempMax > tMax) then  tMax := tempMax;
    //listbox2.Items.Add(inttostr(s)+' '+inttostr(tempMin)+' '+inttostr(tempMax));
    inc(s);
  end;

  //listbox2.Items.Add(inttostr(tMin)+' '+inttostr(tmax));

  smin := sBatas;
  smax := 0;
  tempMin :=sBatas;
  tempMax := 0;
  //cari batas skala
  n := tStart;
  while n < tBatas do begin
    s := sStart;

    //  hitung dari gadapet sampai dapet;
    while (dataCWT[n,s] < thr)AND(s < sBatas) do inc(s);
    if (s <> sBatas) then begin
      tempMin := s;
      while (dataCWT[n,s] > thr) AND (s < sBatas) do inc(s);
      if (s < sBatas) then tempMax := s;
    end
    else tempMax  := 0;
    //  jika
    if(tempMin < sMin) then sMin := tempMin;
    if (tempMax > sMax) then  sMax := tempMax;
    //listbox2.Items.Add(inttostr(n)+' '+inttostr(tempMin)+' '+inttostr(tempMax));
    inc(n);
  end;

  // hitung cog

  tsSum := 0;
  sSum := 0;
  tsum := 0;
  for s := sStart to sBatas do begin
    for n := tStart to tBatas do begin
      if (dataCWT[n,s] > thr) then begin
        tsSum := tsSum + (n)*(s);
        ssum := ssum + (s);
        tsum := tsum + (n)
      end;
    end;
  end;

  sCog := tsSum/tsum;
  tCog := tsSum/sSum;

  //gambar data
  Bitmap := TBitmap.Create;
  //gambar garis
  try
    Bitmap.PixelFormat := pf24bit;
    Bitmap.Width := banyakData;
    Bitmap.Height := banyakSkala;
    image1.Width := banyakData;
    image1.Height := banyakSkala;

    for n := 0 to Bitmap.Width-1 do begin
    for s := 1 to Bitmap.Height do begin
      //if ((n = tMin)OR(n = tMax)OR(s = smin)OR(s=smax)) then image1.Canvas.Pixels[n,s] := RGB(255,255,255)
      if (n = round(tcog))OR(s = round(scog)) then image1.Canvas.Pixels[n,s] := RGB(0,0,0)
      else if dataCWT[n,s] > strtofloat(label4.Caption) then  image1.Canvas.Pixels[n,s] := RGB(255,255,255)
      else begin
        //WavelengthToRGB((dataCWT[n,s]-mincWT)/(maxCWT-minCWT)*400+380);
        WaveLengthToRGB(380);
        image1.Canvas.Pixels[n,s] := RGB(R,G,B);
      end;
    end;
  end;
  finally
    bitmap.Free;
  end;

  //sCog := ((scog)+strtoint(edit8.Text){start pix})/strtofloat(edit9.Text);
  //tCog := (tcog)/strtofloat(edit12.Text){fs};

  edit16.Text := floattostr(tcog);
  edit17.Text := floattostr(scog);

end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  gtrigger := false;
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  scrollbar1.Position := trunc(strtofloat(edit19.Text)*100);
end;

procedure TForm1.Button1Click(Sender: TObject);

begin
  series1.Clear;
  series2.Clear;
  series3.Clear;
  series4.Clear;
  series5.Clear;
  series6.Clear;
  series7.Clear;
  series8.Clear;
  series9.Clear;
  series10.Clear;
  series11.Clear;
  series12.Clear;
  series13.Clear;
  series14.Clear;
  series15.Clear;


  if combobox1.Text = 'Data Uji' then begin
    datauji;
    //bpf;
    //dwt;
  end

  else if combobox1.Text = 'Type 1' then begin
    type1;
    if (radiobutton1.Checked) then bpf
    else if(radiobutton2.Checked)then begin
      bpf;
      dwt;
    end;
  end

  else if combobox1.Text = 'Type 2' then begin
    type2;
    if (radiobutton1.Checked) then bpf
    else if(radiobutton2.Checked)then begin
      bpf;
      dwt;
    end;
  end;


end;

procedure TForm1.Button2Click(Sender: TObject);
var
  max, sum,temp :real;
  means,stddevs,sc : real;
  Ex : myArray;
  I,K,II : integer;
  frame : integer;
begin
  max := 0;
  //  cari nilai max
  for I := 0 to banyakData-1 do begin
    if abs(data[i]) > max then max := data[i];
  end;

  // normalize
  for I := 0 to banyakdata-1 do data[i] := data[i]/max;
  //  framing
  frame := round(0.02*(fs)); //normal


  I := 0;
  K := 0;
  temp := 0;
  series6.Clear;
  while(I < banyakData)do begin
    sum := 0;
    for II := I to I + frame do begin
      if(data[i]<>0) then sum := sum + sqr(data[i])*log10(sqr(data[i]))
      else sum := sum + 0;
    end;
    Ex[k] := (-1/frame)*sum;
    temp := temp + Ex[k];
    //  I := I + round(frame/2);  {percobaan pertama}
    I := I + 1;
    //  series6.AddXY(k/(fs),Ex[k]);
    inc(K);
  end;

  //  finding means
  means := temp/k;

  //  finding stddev
  sum := 0;
  for I := 0 to k-1 do sum := sum + sqr(Ex[I]-means);
  stddevs := sqrt(sum/k);

  //  ShowMessage(floattostr(means));
  //  ShowMessage(floattostr(stddevs));

  //  showMessage(inttostr(banyakData)+' '+inttostr(k));
  //  Ex -> menjadi ternormalisasi
  for I := 0 to k-1 do begin
    Ex[i] := (Ex[i]-means)/stddevs;
    sc := banyakData*(i/k); {persen dari jumlah data}
    //series6.AddXY(sc/fs,Ex[i]*10000);
  end;

  //  upsampling dipakai kalau jumlah K < BanyakData
  //  y1 -> upsampling
  {for I := 0 to banyakData-1 do begin
    y1[I] := Ex[(I div round(banyakData/k))];
    //series6.AddXY(I/fs,y1[i]*10000);
  end;}
  y1 := Ex;
  //  filtered reverse direction
  I := 0;
  pmax := 0;
  pmin := 99999;
  while (I < BanyakData) do begin
    sum := 0;
    for II := I-frame to I do begin
      if II < 0 then sum := sum + 0
      else sum := sum + y1[II];
    end;
    y2[I] := sum/frame;
    if (y2[i] > pmax)  then pmax := y2[i]
    else if (y2[i] < pmin) then pmin := y2[i];
    //  series6.AddXY(I/fs,y2[i]*10000);
    inc(I);
  end;

  {for I := 0 to k-1 do begin
    for II := I-1 to I do begin
      if II < 0 then sum := sum +0
      else sum := sum + y1[II];
    end;
    y2[I] := sum/frame;
    sc := banyakData*(i/k);
    series6.AddXY(sc/fs,Ex[i]*10000)
  end; }

  y1 := y2;

  //filetered forward
  I := 0;
  pmax := 0;
  pmin := 99999;
  while (I < BanyakData) do begin
    sum := 0;
    for II := I to I+Frame do begin
      if II > banyakData-1 then sum := sum + 0
      else sum := sum + y1[II];
    end;
    y2[I] := sum/frame;
    if (y2[i] > pmax)  then pmax := y2[i]
    else if (y2[i] < pmin) then pmin := y2[i];
    //  series6.AddXY(I/fs,y2[i]*10000);
    inc(I);
  end;
  cmax := pmax;

  //  plot
  for I := 0 to banyakdata-1 do begin
    series6.AddXY(i/fs,y2[i]/pmax*max);
    series8.AddXY(i/fs,y2[i]);
  end;
  button8.Enabled := True;

end;

procedure TForm1.bpf;
var
  r,teta,b,gain : real;
  n : integer;
begin
  //  LPF
  r:=0.9;
  teta:=2*pi*330/11025;
  b:= Cos(teta);

  //  normalize
  for n:=0 to 20 do
  begin
    y1[-n]:=y1[0];
    data[-n]:=data[0];
  end;

  gain:=(1-8*r*cos(teta)+24*r*r*sqr(Cos(teta))+4*r*r-24*power(r,3)*cos(teta)-32*r*r*r*power(Cos(teta),3)+6*r*r*r*r+48*r*r*r*r*sqr(cos(teta))+16*r*r*r*r*power(Cos(teta),4)-24*power(r,5)*cos(teta)-32*power(r,5)*power(Cos(teta),3)+24*power(r,6)*sqr(Cos(teta))+4*power(r,6)-8*power(r,7)*cos(teta)+power(r,8))/256;
  for n:=0 to banyakData-1 do begin
    y1[n]:= 8*b*r*y1[n-1]-4*r*r*(6*b*b+1)*y1[n-2]+8*r*r*r*(3*b+4*b*b*b)*y1[n-3]-r*r*r*r*(6+48*b*b+16*b*b*b*b)*y1[n-4]+8*r*r*r*r*r*(3*b+4*b*b*b)*y1[n-5]-4*r*r*r*r*r*r*(6*b*b+1)*y1[n-6]+8*b*r*r*r*r*r*r*r*y1[n-7]-r*r*r*r*r*r*r*r*y1[n-8]+gain*(data[n]+8*data[n-1]+28*data[n-2]+56*data[n-3]+70*data[n-4]+56*data[n-5]+28*data[n-6]+8*data[n-7]+data[n-8]);
  end;

  //      HPF
  r:=0.99;
  teta:=2*pi*20/11025;
  b:= Cos(teta);

  for n:=0 to 20 do
  begin
    y2[-n]:=y2[0];
    y1[-n]:=y1[0];
  end;
  gain:=(1+8*r*cos(teta)+24*r*r*sqr(Cos(teta))+4*r*r+24*power(r,3)*cos(teta)+32*r*r*r*power(Cos(teta),3)+6*r*r*r*r+48*r*r*r*r*sqr(cos(teta))+16*r*r*r*r*power(Cos(teta),4)+24*power(r,5)*cos(teta)+32*power(r,5)*power(Cos(teta),3)+24*power(r,6)*sqr(Cos(teta))+4*power(r,6)+8*power(r,7)*cos(teta)+power(r,8))/256;

  for n:=0 to banyakData-1 do
  begin
    y2[n]:= 8*b*r*y2[n-1]-4*r*r*(6*b*b+1)*y2[n-2]+8*r*r*r*(3*b+4*b*b*b)*y2[n-3]-r*r*r*r*(6+48*b*b+16*b*b*b*b)*y2[n-4]+8*r*r*r*r*r*(3*b+4*b*b*b)*y2[n-5]-4*r*r*r*r*r*r*(6*b*b+1)*y2[n-6]+8*b*r*r*r*r*r*r*r*y2[n-7]-r*r*r*r*r*r*r*r*y2[n-8]+gain*(y1[n]-8*y1[n-1]+28*y1[n-2]-56*y1[n-3]+70*y1[n-4]-56*y1[n-5]+28*y1[n-6]-8*y1[n-7]+y1[n-8]);
  end;

  data := y2;
  for n:=0 to banyakData-1 do
  begin
    series4.AddXY(n/fs,data[n]);
    if radiobutton1.Checked then series5.AddXY(n/fs,data[n]);
  end;
end;

procedure TForm1.DWT;
var
  h,g: array[0..3]of real;
  I,J,decom_factor : integer;
begin
  //  parameter
  h[0]:= (1+sqrt(3))/(4*sqrt(2));
  h[1]:= (3+sqrt(3))/(4*sqrt(2));
  h[2]:= (3-sqrt(3))/(4*sqrt(2));
  h[3]:= (1-sqrt(3))/(4*sqrt(2));
  for I := 0 to 3 do g[i] := power(-1,i)*h[3-i];

  //  decompose 1
  for I := 0 to banyakdata div 2 do begin
    a1[i] := 0;
    d1[i] := 0;
    for J := 0 to 3 do begin
      a1[i] :=a1[i] + h[j]*data[2*I+j];
      d1[i] :=d1[i] + g[j]*data[2*I+j];
    end;
    series10.AddXY(i*2/fs,d1[i]);
  end;

  //  decompose 2
  for I := 0 to banyakdata div 4 do begin
    a2[i] := 0;
    d1[i] := 0;
    for J := 0 to 3 do begin
      a2[i] :=a2[i] + h[j]*a1[2*I+j];
      d1[i] :=d1[i] + g[j]*a1[2*I+j];
    end;
    series11.AddXY(i*4/fs,d1[i]);
  end;
  a1 := a2;

  //  decompose 3
  for I := 0 to banyakdata div 8 do begin
    a2[i] := 0;
    d1[i] := 0;
    for J := 0 to 3 do begin
      a2[i] :=a2[i] + h[j]*a1[2*I+j];
      d1[i] :=d1[i] + g[j]*a1[2*I+j];
    end;
    series12.AddXY(i*8/fs,d1[i]);
  end;
  a1 := a2;


  //  decompose 4
  for I := 0 to banyakdata div 16 do begin
    a2[i] := 0;
    d1[i] := 0;
    for J := 0 to 3 do begin
      a2[i] :=a2[i] + h[j]*a1[2*I+j];
      d1[i] :=d1[i] + g[j]*a1[2*I+j];
    end;
    series13.AddXY(i*16/fs,d1[i]);
  end;
  a1 := a2;

   //  final
  //  normalize data
  //  zero data
  decom_factor := 4;
  for I := 0 to banyakdata-1 do data[I] := 0;
  data := d1;
  //  ubah jumlah data dan fs
  fs := fs/Power(2,decom_factor);
  edit12.Text := floattostr(fs);
  banyakData := banyakData div round(Power(2,decom_factor));
  edit11.Text := inttostr(banyakData);
  //showMessage(inttostr(i)+' '+inttostr(BanyakData));
  for I := 0 to banyakData-1 do series5.AddXY(i/fs,data[i]);

  //  decompose 5
  {for I := 0 to banyakdata div 32 do begin
    a2[i] := 0;
    d1[i] := 0;
    for J := 0 to 3 do begin
      a2[i] :=a2[i] + h[j]*a1[2*I+j];
      d1[i] :=d1[i] + g[j]*a1[2*I+j];
    end;
    series14.AddXY(i*32/fs,d1[i]);
  end;
  a1 := a2;}

end;

procedure TForm1.Button3Click(Sender: TObject);
var
  I : integer;
  teta : real;
begin
  series2.Clear;
  teta := strtofloat(edit5.Text);
  for i:= -500 to 500 do series2.AddXY(i/100,MotherWavelet(i/100,teta,'Morlet','Real'));
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  teta,ds,sum,sumre,sumim,taw,scale : real;
  start_pix,n,s,t : integer;
  save : TStringList;
  savePath : string;
begin
  if combobox1.Text = 'Data Uji' then begin
    cutData := data;
  end;
  banyakSkala := strtoint(edit10.Text);
  banyakData := strtoint(edit11.Text);
  fs := strtofloat(edit12.Text);
  //  defining parameter
  //  teta -> omega
  teta := strtofloat(edit5.Text);
  ds := strtofloat(edit9.Text);
  edit8.Text := inttostr(round(0.001*ds));
  start_pix := strtoint(edit8.Text);
  savePath := 'D:\Belajar\Kuliah\ASN\Program ASN\CWT 1 Pak Arifin\Hasil\Perfect\';

  //  initiate saving
  save := Tstringlist.Create;
  save.Add(inttostr(banyakData));
  save.Add(inttostr(banyakSkala));

  //  looping
  for n := 0 to banyakData-1 do begin
    for s := 1 to banyakSkala do begin
      sumre :=0;
      sumIm := 0;
      taw := n/fs;
      scale := (s+start_pix)/ds;
      for t := 0 to banyakData-1 do begin
        sumRe := sumRe + cutData[t]*MotherWavelet((t/fs-taw)/scale,teta,'Morlet','Real')*(1.0/sqrt(abs(scale)));
        sumIm := sumIm + cutData[t]*MotherWavelet((t/fs-taw)/scale,teta,'Morlet','Imaginer')*(1.0/sqrt(abs(scale)));
      end;
      sum := sqrt(sqr(sumre)+sqr(sumim));
      save.Add(floattostr(sum));
    end;
  end;

  save.SaveToFile(savepath+edit6.Text+'.dat');
  save.Destroy;
  //  showMessage(savepath+'W'+inttostr(banyakData)+'_H'+inttostr(banyakSkala)+'.dat');
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  datFile : TextFile;
  Bitmap : Tbitmap;
  n,s : integer;
  openpath : string;
  max,val :real;
  nData, nSkala : integer;
begin
  // initiate
  bitmap := Tbitmap.Create;
  if opendialog1.Execute then openpath := opendialog1.FileName;


  //  find max
  AssignFile(datFile,openpath);
  reset(datFile);
  readln(datFile, nData);
  readln(datFile, nSkala);

  max := 0;
  for n := 0 to Ndata-1 do begin
    for s := 1 to nSkala do begin
      readln(datFile,val);
      if(val>max)then max := val;
    end;
  end;
  closeFile(datFile);
  //showMessage(floattostr(max));

  //convert to bitmap
  AssignFile(datFile,openpath);
  reset(datFile);
  try
    //  bitmap parameter
    Bitmap.PixelFormat := pf24bit;
    Bitmap.Width := nData;
    bitmap.Height := NSkala;

    for n := 0 to Bitmap.Width-1 do begin
    for s := 10 to Bitmap.Height do begin
      readln(datFile,val);
      WavelengthToRGB(val/max*400+380);
      Bitmap.Canvas.Pixels[n,s] := RGB(R,G,B);
    end;
    bitmap.SaveToFile('D:\Belajar\Kuliah\ASN\Program ASN\CWT 1 Pak Arifin\hasil.bmp');
  end;
  finally
    bitmap.Free;
  end;

end;

procedure TForm1.Button6Click(Sender: TObject);
var
  i : integer;
begin
  //  DFT
  banyakData := strtoint(edit11.Text);
  dft(@cutData,banyakData);
  fs := strtofloat(edit12.Text);
  for i := 0 to round(fs/2) do series3.AddXY(i*fs/Banyakdata,DFT_OUT[i]);
end;

procedure TForm1.Button7Click(Sender: TObject);
var
  datFile : TextFile;
  Bitmap : Tbitmap;
  n,s : integer;
  openpath : string;
  max,val :real;
  nData, nSkala : integer;
  temp : array[0..499,1..200]of real;
begin
  // initiate
  bitmap := Tbitmap.Create;
  if opendialog1.Execute then openpath := opendialog1.FileName;


  //  find max min
  AssignFile(datFile,openpath);
  reset(datFile);
  readln(datFile, nData);
  readln(datFile, nSkala);

  max := 0;
  minCWT := 999999;
  for n := 0 to Ndata-1 do begin
    for s := 1 to nSkala do begin
      readln(datFile,val);
      if(val>max)then max := val
      else if (val<minCWT) then minCWT := val;
    end;
  end;
  closeFile(datFile);
  maxCWT := max;

  showMessage(floattostr(maxCWT)+' '+floattostr(minCWT));

  //showMessage(floattostr(max));

  //convert to bitmap
  AssignFile(datFile,openpath);
  reset(datFile);
  readln(datFile, nData);
  readln(datFile, nSkala);
  banyakData := nData;
  banyakSkala := nSkala;
  //  read data
  for n := 0 to nData-1 do begin
      for s := 1 to nSkala do begin
        readln(datFile,val);
        dataCWT[n,s] := val;
      end;
  end;

  //  normalize data
  for n := 0 to 499 do begin
    for s := 1 to 200 do begin
      temp[n,s] := dataCWT[trunc(n/500*nData),s];
    end;
  end;

  //  assign to datacwt
  for n := 0 to 499 do begin
    for s := 1 to 200 do begin
      datacwt[n,s] := temp[n,s];
    end;
  end;
  banyakData :=500;
  banyakSkala :=500;

  try
    //  bitmap parameter
    Bitmap.PixelFormat := pf24bit;
    Bitmap.Width := 500;
    Bitmap.Height := 200;
    image1.Width := 500;
    image1.Height := 200;


    for n := 0 to Bitmap.Width-1 do begin
      for s := 1 to Bitmap.Height do begin
        WavelengthToRGB((temp[n,s]-mincWT)/(maxCWT-minCWT)*400+380);
        image1.Canvas.Pixels[n,s] := RGB(R,G,B);
        //listbox2.Items.Add(inttostr(n)+' '+inttostr(trunc(n/Bitmap.Width*500)));
        //Bitmap.Canvas.Pixels[n,s] := RGB(R,G,B);
      end;
    end;

  finally
    bitmap.Free;
  end;

end;

procedure TForm1.Button8Click(Sender: TObject);
var
  thr,cenv,max :real;
  I,posmax,iterPos,cyc : integer;
  upPos,maxPos : array[0..100]of real;
begin
  cenv := strtofloat(edit7.Text);
  thr := pmin + cenv*pmax;
  series7.Clear;
  series7.LegendTitle := 'Thr';
  listbox1.Clear;

  I := 10;
  iterPos := 0;
  while I < banyakData do begin
    while(y2[i] < thr)AND(I < banyakData) do begin
      series7.AddXY(I/fs,pmin);
      inc(i);
    end;
    listbox1.Items.Add('Naik '+inttostr(i)+' '+floattostr(i/fs));

    if (y2[i] > thr) then begin
      upPos[iterPos] := i/fs;
      max := 0;
    end;

    while(y2[i] > thr)AND(I < banyakData) do begin
      series7.AddXY(I/fs,pmax);
      if(y2[i] > max)then begin
        max := y2[i];
        posmax := i;
      end;
      inc(i);
    end;
    listbox1.Items.Add('Turun '+inttostr(i)+' '+floattostr(i/fs));
    listbox1.Items.Add('==================');
    //listbox1.Items.Add('Pos Max : '+floattostr(posmax/fs));
    MaxPos[iterPos] := posmax/fs;
    inc(iterpos);
  end;

  //regard pos 0;
  {
  cyc := 1;
  //  start = 1 -> exclude puncak pertama karena window
  for I := 0 to iterpos-1 do begin
    if I mod 2 = 0 then begin
      if I > 1 then begin
        listbox1.Items.Add('Diastolic: '+floattostr(upPos[i]-uppos[i-1]));
        listbox1.Items.Add('Duration : '+floattostr(upPos[i]-upPos[i-2]));
        listbox1.Items.Add(' ');
        listbox1.Items.Add('*********');
        inc(cyc);
      end;
      listbox1.Items.Add('Cycle    '+inttostr(cyc));
      listbox1.Items.Add('Start S1 : '+floattostr(upPos[I]));
      listbox1.Items.Add('Pos S1 : '+inttostr(round(upPos[i]*fs)));
      listbox1.Items.Add('S1        : '+floattostr(maxPos[i]));
    end

    else begin
      listbox1.Items.Add('Start S2 : '+floattostr(upPos[I]));
      listbox1.Items.Add('Pos S2 : '+inttostr(round(upPos[i]*fs)));
      listbox1.Items.Add('S2        : '+floattostr(maxPos[i]));
      listbox1.Items.Add('Systolic : '+floattostr(upPos[i]-upPos[i-1]));
    end;
  end;
  }
end;

procedure TForm1.Button9Click(Sender: TObject);
var
  I,startPos,stopPos,iter,pt: Integer;
begin
  startPos := strtoint(edit13.Text);
  stopPos := strtoint(edit14.Text);
  series9.Clear;
  series15.Clear;
  series16.Clear;
  iter := 0;
  pt := strtoint(edit15.Text);
  for I := startPos to stopPos do begin
    if I mod pt = 0 then begin
      cutData[iter] := data[i];
      series9.AddXY(iter/fs,cutData[iter]);
      series15.addXY(iter/(stopPos-startPos)*100,cutData[iter]);
      //  plot shannon
      series16.AddXY(iter/(stopPos-startPos)*100,y2[I]/pmax*cmax);
      inc(iter);
    end;
  end;

  //into graphical



  //  banyak data berubah
  edit11.Text := inttostr((stopPos-startPos)div pt);
  edit12.Text := floattostr(fs/pt);
end;

procedure TForm1.dft(data:pArray;localN:integer);
var
  k,n:integer;
  realVal,imagVal : real;
begin
  for k := 0 to (localN div 2)-1 do
  begin
    realVal := 0;
    imagVal := 0;
    for n := 0 to localN-1 do
    begin
      realVal := realVal +  data^[n]*cos(2*PI*k*n/localN);
      imagVal := imagVal +  data^[n]*sin(2*PI*k*n/localN);
    end;
    DFT_OUT[k] := sqrt(sqr(realVal) + sqr(imagVal));
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  gtrigger := false;
  pagecontrol1.ActivePageIndex := 0;
  combobox1.Clear;
  combobox1.Items.Add('Data Uji');
  combobox1.Items.Add('Type 1');
  combobox1.Items.Add('Type 2');
  Button8.Enabled := false;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
  if not gtrigger then gtrigger := not gtrigger
  else begin  button10.Click;gtrigger := not gtrigger;end;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if not gtrigger then begin
    label5.Caption := inttostr(x);
    label6.Caption := inttostr(y);
  end
  else begin
    label7.Caption := inttostr(x);
    label8.Caption := inttostr(y);
  end;
end;

Function TForm1.MotherWavelet(inTime : real; inTeta : real;stringType, stringOut : string):real;
var
  cTeta, kTeta : real;
  re, im :real;
begin

  cTeta := Power(1 + exp(-sqr(inteta)) - 2*exp(-0.75*sqr(inteta)),-0.5);
  cTeta := 1;
  kTeta := exp(-0.5*sqr(inteta));
  kTeta := 0;

  re := cTeta*Power(pi,-0.25)*exp(-0.5*sqr(intime))*(cos(inTeta*inTime) - kTeta);
  im := cTeta*Power(pi,-0.25)*exp(-0.5*sqr(intime))*(-sin(inTeta*inTime) - kTeta);
  if(stringType = 'Morlet Real Only')then MotherWavelet := re
  else if(stringType = 'Morlet') then
    if(stringOut = 'Real')then MotherWavelet := re
    else if(stringOut = 'Imaginer')then MotherWavelet := im;
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
var
  thr : real;
  n,s : integer;
  Bitmap : Tbitmap;
begin

  thr := minCWT + scrollbar1.Position/100*maxCWT;
  label4.Caption := floattostr(thr);
  edit18.text := floattostr(thr);
  label9.Caption := floattostr(scrollbar1.Position/100);
  //image1.CleanupInstance;
  bitmap :=  Tbitmap.Create;
  try
    //  bitmap parameter
    Bitmap.PixelFormat := pf24bit;
    Bitmap.Width := banyakData;
    Bitmap.Height := banyakSkala;
    image1.Width := banyakData;
    image1.Height := banyakSkala;

    for n := 0 to Bitmap.Width-1 do begin
    for s := 1 to Bitmap.Height do begin
      if (dataCWT[n,s]>thr)then begin
        WavelengthToRGB((dataCWT[n,s]-mincWT)/(maxCWT-minCWT)*400+380);
        image1.Canvas.Pixels[n,s] := RGB(R,G,B);
      end
      else image1.Canvas.Pixels[n,s] := RGB(0,0,0);
      //Bitmap.Canvas.Pixels[n,s] := RGB(R,G,B);
    end;
  end;
  finally
    bitmap.Free;
  end;
end;

end.
