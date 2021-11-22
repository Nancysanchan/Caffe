unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls;

type
  TForm5 = class(TForm)
    DBLookupListBox1: TDBLookupListBox;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses Unit2, Unit4;

{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
begin
Form5.Visible:=False;
Form4.Label4.Caption:= DataModule1.DataSPers.DataSet.Fields[0].AsString;
Form4.Label5.Caption:= DataModule1.DataSPers.DataSet.Fields[1].AsString;
Form4.Label20.Caption:= DataModule1.DataSPers.DataSet.Fields[2].AsString;
Form4.GroupBox3.Visible:=True;
Form4.GroupBox2.Enabled:=True;
Form4.GroupBox6.Visible:=True;
Form4.Panel2.Enabled:=True;
Form4.Panel3.Enabled:=True;
Form4.DBGrid1.Enabled:= True;
Form4.Button1.Visible:=False;
end;

end.
