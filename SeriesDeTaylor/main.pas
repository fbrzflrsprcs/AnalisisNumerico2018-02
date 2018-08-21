unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  class_taylor;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnExecuteArcSen: TButton;
    btnExecuteArcTan: TButton;
    btnExecuteExp: TButton;
    btnExecuteLn: TButton;
    btnExecuteSen: TButton;
    btnExecuteCos: TButton;

    ediX: TEdit;
    ediError: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    memResult: TMemo;
    procedure btnExecuteSenClick(Sender: TObject);
    procedure btnExecuteCosClick(Sender: TObject);
    procedure btnExecuteExpClick(Sender: TObject);
    procedure btnExecuteLnClick(Sender: TObject);
    procedure btnExecuteArcSenClick(Sender: TObject);
    procedure btnExecuteArcTanClick(Sender: TObject);

  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btnExecuteSenClick(Sender: TObject);
var Taylor: TTaylor;
begin
  Taylor:= TTaylor.Create;
  Taylor.Error:= StrToFloat( ediError.Text );
  Taylor.x:= StrToFloat( ediX.Text );
  memResult.Lines.Add( 'Sen(' + ediX.Text + ') = ' + FloatToStr( Taylor.seno() ) );
  Taylor.Destroy;
end;

procedure TForm1.btnExecuteCosClick(Sender: TObject);
var Taylor: TTaylor;
begin
  Taylor:= TTaylor.Create;
  Taylor.Error:= StrToFloat( ediError.Text );
  Taylor.x:= StrToFloat( ediX.Text );
  memResult.Lines.Add( 'Cos(' + ediX.Text + ') = ' + FloatToStr( Taylor.cose() ) );
  Taylor.Destroy;
end;

procedure TForm1.btnExecuteExpClick(Sender: TObject);
begin

end;

procedure TForm1.btnExecuteLnClick(Sender: TObject);
begin

end;

procedure TForm1.btnExecuteArcSenClick(Sender: TObject);
begin

end;

procedure TForm1.btnExecuteArcTanClick(Sender: TObject);
begin

end;



end.

