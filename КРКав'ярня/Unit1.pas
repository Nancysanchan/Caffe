unit Unit1;

interface

uses
  DB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, ComCtrls, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label7: TLabel;
    Label1: TLabel;
    Button2: TButton;
    Edit5: TEdit;
    Button16: TButton;
    Button18: TButton;
    Button19: TButton;
    Edit2: TEdit;
    Button10: TButton;
    Button11: TButton;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Button4: TButton;
    Button6: TButton;
    DBLookupComboBox1: TDBLookupComboBox;
    Button1: TButton;
    TabSheet3: TTabSheet;
    DBGrid3: TDBGrid;
    Panel4: TPanel;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    TabSheet4: TTabSheet;
    DBGrid5: TDBGrid;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    Panel5: TPanel;
    Button3: TButton;
    Button5: TButton;
    Button14: TButton;
    Edit6: TEdit;
    Edit7: TEdit;
    Button12: TButton;
    Label6: TLabel;
    Label8: TLabel;
    TabSheet5: TTabSheet;
    DBGrid4: TDBGrid;
    Panel6: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Edit8: TEdit;
    Button13: TButton;
    Button15: TButton;
    DateTimePicker1: TDateTimePicker;
    Button17: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Unit7, Unit8;

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
begin
//DataModule1.ADOQTovari.Close;
//DataModule1.ADOQTovari.SQL.Text:= 'SELECT Tovari.���_������, Tovari.������������ AS Tovari_������������, Brend.������������ AS Brend_������������, Tovari.��_���, Tovari.����_��_��_��� '
//+' FROM Brend INNER JOIN Tovari ON Brend.[���_������] = Tovari.[���_������] ORDER BY Tovari.���_������';
//DataModule1.ADOQTovari.Open;

DataModule1.ADOQMenu.Close;
DataModule1.ADOQMenu.SQL.Text:= 'SELECT ����.���_����, ����.�����_�������, �������.����� AS �������_�����, ����.�����, ����.ֳ�� '
+ ' FROM ������� INNER JOIN ���� ON �������.[���_���] = ����.[���_���]';
DataModule1.ADOQMenu.Open;

DataModule1.ADOQWork.Close;
DataModule1.ADOQWork.SQL.Text:= 'SELECT ����������.���_�����, ��������.ϲ�, ����������.ֳ��_�����, ����������.ʳ������, ����������.���_���'
+ ' FROM �������� INNER JOIN ���������� ON ��������.[���_�����] = ����������.[���_�����]';
DataModule1.ADOQWork.Open;

DataModule1.ADOQCheck.Close;
DataModule1.ADOQCheck.SQL.Text:= 'SELECT ���.[���], ���.[����], ���.[����_����������]'
+ ' FROM ���';
DataModule1.ADOQCheck.Open;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 if (Edit1.Text='') then
begin
   ShowMessage('������ ���� ��� ��������� ������')
end
else begin
DataModule1.ADOQWork.Close;
DataModule1.ADOQWork.SQL.Text:='INSERT INTO ���� ( [�����_�������], [���_���], [�����], [ֳ��] ) values ("'+Edit1.Text+'", '+IntToStr(DBLookupComboBox1.KeyValue)+', '+Edit4.Text+', '+Edit3.Text+')';
DataModule1.ADOQWork.ExecSQL;

DataModule1.ADOQMenu.Close;
DataModule1.ADOQMenu.SQL.Text:= 'SELECT ����.���_����, ����.�����_������� AS ����_������������, �������.����� AS �������_������������, ����.�����, ����.ֳ�� '
+' FROM �������, ���� WHERE �������.[���_���] = ����.[���_���] ORDER BY ����.���_����';
DataModule1.ADOQMenu.Open;

panel2.Visible:=False;
end;
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
Edit1.Text:='';
Edit3.Text:='';
Edit4.Text:='0';
DBLookupComboBox1.KeyValue:=1;
Button1.Visible:=true;
Button4.Visible:=false;
Panel2.Visible:=true;

end;

procedure TForm1.Button19Click(Sender: TObject);
begin
Edit1.Text:=DBGrid1.Fields[1].AsString;
  Edit3.Text:=DBGrid1.Fields[4].AsString;
  Edit4.Text:=DBGrid1.Fields[3].AsString;
DataModule1.ADOTKat.Locate('�����',DBGrid1.Fields[2].AsString,[loCaseInsensitive, loPartialKey]);
 // !!!������ ��������!!! ��� ���� ��� �� �������� � ������� "����" ��� ���������
//��� ����� �������� �������� �������� ��� ���������, �� � ��� ���� ������ �� �������� �� DBGrid1 - ������ ����. ��� ����� ������������ ��� ������ ��� ���� � ADOTable ������ ������ �� �������� ��������� � ��������� ��������� �� ��������� ������
DBLookupComboBox1.KeyValue:= StrToInt(DataModule1.DataSKat.DataSet.Fields[0].AsString);

Button1.Visible:=false;
Button4.Visible:=True;

Panel2.Visible:=true;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
DataModule1.ADOQWork.Close;
DataModule1.ADOQWork.SQL.Text:='UPDATE ���� SET ����.�����_������� = "'+Edit1.Text+'", ����.���_��� = '+IntToStr(DBLookupComboBox1.KeyValue)+', ����.����� = '+Edit4.Text+', ����.ֳ�� = '+Edit3.Text+' '
+' WHERE (((����.���_����)='+DBGrid1.Fields[0].AsString+'))';
DataModule1.ADOQWork.ExecSQL;

FormShow(Sender);


panel2.Visible:=False;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
DataModule1.ADOQWork.Close;
DataModule1.ADOQWork.SQL.Text:= 'DELETE * FROM ���� Where (����.���_���� = '+DBGrid1.Fields[0].AsString+')';
DataModule1.ADOQWork.ExecSQL;
FormShow(Sender);
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
DataModule1.ADOQMenu.Close;
DataModule1.ADOQMenu.SQL.Text:= 'SELECT ����.���_����, ����.�����_������� AS ����_������������, �������.����� AS �������_������������, ����.�����, ����.ֳ�� '
+' FROM ������� INNER JOIN ���� ON �������.[���_���] = ����.[���_���] where ����.���_���� = '+Edit2.Text+' ORDER BY ����.���_����';
DataModule1.ADOQMenu.Open;
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
DataModule1.ADOQMenu.Close;
DataModule1.ADOQMenu.SQL.Text:= 'SELECT ����.���_����, ����.�����_������� AS ����_������������, �������.����� AS �������_������������, ����.�����, ����.ֳ�� '
+' FROM �������, ���� WHERE �������.[���_���] = ����.[���_���] ORDER BY ����.���_����';
DataModule1.ADOQMenu.Open;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
Edit1.Text:='';
Edit3.Text:='';
Edit4.Text:='';
FormShow(Sender);
panel2.Visible:=False;
end;

procedure TForm1.Edit5Change(Sender: TObject);
begin
DataModule1.ADOQMenu.Close;
DataModule1.ADOQMenu.SQL.Text:= 'SELECT ����.���_����, ����.�����_������� AS ����_������������, �������.����� AS �������_������������, ����.�����, ����.ֳ�� '
+' FROM ������� INNER JOIN ���� ON �������.[���_���] = ����.[���_���] where ����.�����_������� like "%'+Edit5.Text+'%" ORDER BY ����.���_����';
DataModule1.ADOQMenu.Open;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
DataModule1.ADOTPers.Insert;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
if  DataModule1.ADOTPers.Modified then
 DataModule1.ADOTPers.Post;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
DataModule1.ADOTPers.Delete;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
DataModule1.ADOTKat.Insert;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
if  DataModule1.ADOTKat.Modified then
 DataModule1.ADOTKat.Post;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
DataModule1.ADOTKat.Delete;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
DataModule1.ADOQWork.Close;
DataModule1.ADOQWork.SQL.Text:= 'SELECT ����������.���_�����, ��������.ϲ�, ����������.ֳ��_�����, ����������.ʳ������, ����������.���_���'
+ ' FROM �������� INNER JOIN ���������� ON ��������.[���_�����] = ����������.[���_�����] where ����������.���_����� = '+Edit6.Text+' ORDER BY ����������.���_�����';
DataModule1.ADOQWork.Open;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
DataModule1.ADOQWork.Close;
DataModule1.ADOQWork.SQL.Text:= 'SELECT ����������.���_�����, ��������.ϲ�, ����������.ֳ��_�����, ����������.ʳ������, ����������.���_���'
+ ' FROM �������� INNER JOIN ���������� ON ��������.[���_�����] = ����������.[���_�����] where ����������.���_��� = '+Edit7.Text+' ORDER BY ����������.���_���';
DataModule1.ADOQWork.Open;
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
DataModule1.ADOQWork.Close;
DataModule1.ADOQWork.SQL.Text:= 'SELECT ����������.���_�����, ��������.ϲ�, ����������.ֳ��_�����, ����������.ʳ������, ����������.���_���'
+ ' FROM �������� INNER JOIN ���������� ON ��������.[���_�����] = ����������.[���_�����]';
DataModule1.ADOQWork.Open;
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
DataModule1.ADOQCheck.Close;
DataModule1.ADOQCheck.SQL.Text:= 'SELECT ���.[���], ���.[����], ���.[����_����������]'
+ ' FROM ��� where ���.��� = '+Edit8.Text+' ORDER BY ���.���';
DataModule1.ADOQCheck.Open;
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
DataModule1.ADOQCheck.Close;
DataModule1.ADOQCheck.SQL.Text:= 'SELECT ���.[���], ���.[����], ���.[����_����������]'
+ ' FROM ���';
DataModule1.ADOQCheck.Open;
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
DataModule1.ADOQCheck.Close;
DataModule1.ADOQCheck.SQL.Text:='SELECT ���.[���], ���.[����], ���.[����_����������] FROM ��� WHERE (((���.[����])=:dt));';
DataModule1.ADOQCheck.Parameters.ParamByName('dt').Value:=FormatDateTime('dd.mm.yyyy',DateTimePicker1.Date);
DataModule1.ADOQCheck.Open;
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
Form8.QuickRep1.PreviewModal;
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
Form7.QuickRep1.PreviewModal;
end;

end.
