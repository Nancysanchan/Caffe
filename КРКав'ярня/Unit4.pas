unit Unit4;

interface

uses
  DB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, DBCtrls, ComCtrls, Menus;

type
  TForm4 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Button1: TButton;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label3: TLabel;
    Button2: TButton;
    Button3: TButton;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    GroupBox4: TGroupBox;
    DateTimePicker1: TDateTimePicker;
    GroupBox5: TGroupBox;
    Button4: TButton;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Edit3: TEdit;
    UpDown1: TUpDown;
    Button5: TButton;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Button6: TButton;
    Button7: TButton;
    Label20: TLabel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Panel3: TPanel;
    GroupBox6: TGroupBox;
    DBGrid2: TDBGrid;
    Label21: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  X: word;
  Form4: TForm4;

implementation

uses Unit2, Unit5, Unit1, Unit6, Unit3, Unit9;

{$R *.dfm}

procedure TForm4.FormShow(Sender: TObject);
begin
DateTimePicker1.Date:=Date;
DataModule1.ADOQMenu.Close;
DataModule1.ADOQMenu.SQL.Text:= 'SELECT ����.���_����, ����.�����_�������, �������.����� AS �������_�����, ����.�����, ����.ֳ�� '
+ ' FROM ������� INNER JOIN ���� ON �������.[���_���] = ����.[���_���]';
DataModule1.ADOQMenu.Open;
end;

procedure TForm4.Edit1Change(Sender: TObject);
begin
DataModule1.ADOQMenu.Close;
DataModule1.ADOQMenu.SQL.Text:= 'SELECT ����.���_����, ����.�����_������� AS ����_������������, �������.����� AS �������_������������, ����.�����, ����.ֳ�� '
+' FROM ������� INNER JOIN ���� ON �������.[���_���] = ����.[���_���] where ����.�����_������� like "%'+Edit1.Text+'%" ORDER BY ����.���_����';
DataModule1.ADOQMenu.Open;
end;

procedure TForm4.Edit2Change(Sender: TObject);
begin
DataModule1.ADOQMenu.Close;
DataModule1.ADOQMenu.SQL.Text:= 'SELECT ����.���_����, ����.�����_������� AS ����_������������, �������.����� AS �������_������������, ����.�����, ����.ֳ�� '
+' FROM ������� INNER JOIN ���� ON �������.[���_���] = ����.[���_���] where ����.���_���� like "%'+Edit2.Text+'%" ORDER BY ����.���_����';
DataModule1.ADOQMenu.Open;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
Edit1.Text:='';
Edit2.Text:='';
FormShow(Sender);
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
DataModule1.ADOQMenu.Close;
DataModule1.ADOQMenu.SQL.Text:= 'SELECT ����.���_����, ����.�����_������� AS ����_������������, �������.����� AS �������_������������, ����.�����, ����.ֳ�� '
+' FROM ������� INNER JOIN ���� ON �������.[���_���] = ����.[���_���] where �������.����� like "%'+DBLookupComboBox1.Text+'%" ORDER BY ����.���_����';
DataModule1.ADOQMenu.Open;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
Form5.Visible:=True;
end;

procedure TForm4.DBGrid1CellClick(Column: TColumn);
begin
Label9.Caption:= DataModule1.DataSMenu.DataSet.Fields[1].AsString;
Label12.Caption:= DataModule1.DataSMenu.DataSet.Fields[0].AsString;
Label13.Caption:= DataModule1.DataSMenu.DataSet.Fields[4].AsString;
end;

procedure TForm4.Button4Click(Sender: TObject);
begin
DataModule1.ADOQWork.Close;
DataModule1.ADOQWork.SQL.Text:= 'INSERT INTO ��� ( [����], [����_����������] )  Values (:dt, 0) ';
DataModule1.ADOQWork.Parameters.ParamByName('dt').Value:=FormatDateTime('dd.mm.yyyy', DateTimePicker1.Date);
DataModule1.ADOQWork.ExecSQL;


DataModule1.ADOQWork.close;
DataModule1.ADOQWork.SQL.text:=' select * from ��� order by ���';
DataModule1.ADOQWork.Open;

DataModule1.ADOQWork.Last;
Label16.Caption:= DataModule1.DataSWork.DataSet.Fields[0].AsString;
GroupBox1.Enabled:= True;
Label21.Visible:=True
end;

procedure TForm4.Button5Click(Sender: TObject);
begin
DataModule1.ADOQWork.Close;
DataModule1.ADOQWork.SQL.Text:= 'INSERT INTO ���������� ([���_����], [���_�����], [ֳ��_�����], [ʳ������], [���_���] ) '
 + ' Values ('+Label12.Caption+', '+Label4.Caption+', '+inttostr(strtoint(Edit3.Text)*strtoint(Label13.Caption))+', '+Edit3.Text+', '+Label16.Caption+')';
DataModule1.ADOQWork.ExecSQL;



DataModule1.ADOQWork.Close;
DataModule1.ADOQWork.SQL.Text:=' Select Sum(����������.[ֳ��_�����]) AS [Sum-����] FROM ���������� GROUP BY ����������.[���_���] HAVING (((����������.[���_���])= '+Label16.Caption+'))';
DataModule1.ADOQWork.Open;
label19.caption:= DataModule1.DataSWork.DataSet.Fields[0].AsString;

DataModule1.ADOQWork.Close;
DataModule1.ADOQWork.SQL.Text:=' UPDATE ��� SET ���.[����_����������] = '+Label19.Caption+' WHERE (((���.[���])='+Label16.Caption+'))';
DataModule1.ADOQWork.ExecSQL;

DataModule1.ADOQCheck2.Close;
DataModule1.ADOQCheck2.SQL.Text:= 'SELECT ����������.���_�����, ����.�����_�������, ����.ֳ��, ����������.ʳ������, ����������.ֳ��_�����, ���.����_����������'
+ ' FROM ��� INNER JOIN (���� INNER JOIN ���������� ON ����.���_���� = ����������.���_����) ON ���.��� = ����������.���_��� WHERE (((���.���)='+Form4.Label16.Caption+'));';
DataModule1.ADOQCheck2.Open;
end;

procedure TForm4.N1Click(Sender: TObject);
begin
Form1.Show();
end;

procedure TForm4.N3Click(Sender: TObject);
begin
Form6.Show();
end;
procedure TForm4.Button6Click(Sender: TObject);
begin
DataModule1.ADOQCheck1.Close;
DataModule1.ADOQCheck1.SQL.Text:= 'SELECT ����.�����_�������, ����������.ʳ������, ����.ֳ��, ����������.ֳ��_�����, ����������.���_���'
+ ' FROM ���� INNER JOIN ���������� ON ����.���_���� = ����������.���_���� WHERE (((����������.���_���)= '+Form4.Label16.Caption+'))';
DataModule1.ADOQCheck1.Open;


Form9.QRLabel1.Caption:='��� �'+Label16.Caption;
Form9.QRLabel2.Caption:='����: ' + datetostr(datetimepicker1.date);
Form9.QRLabel3.Caption:='�������: ' + Label20.Caption;
Form9.QRLabel12.Caption:='���� �� ����(���): ' + Label19.Caption;
Form9.QuickRep1.PreviewModal;
end;

procedure TForm4.Button7Click(Sender: TObject);
begin
GroupBox1.Enabled:= False;
Label16.Caption:='0';
Label19.Caption:='0';
Edit3.Text:='1';
end;

procedure TForm4.N2Click(Sender: TObject);
begin
X := MessageDlg('������ � ����� ���������. �� ����� ������ ��������� ������?', MTConfirmation, [MBYes, MBNo], 0);
If X = mrYes then begin
GroupBox1.Enabled:= False;
Label16.Caption:='0';
Label19.Caption:='0';
Edit3.Text:='1';

GroupBox3.Visible:=False;
Button1.Visible:=True;
GroupBox2.Enabled:=False;
Panel2.Enabled:=False;
DBGrid1.Enabled:= False;
Label9.Caption:='���� �������� ������';
Label12.Caption:='���� �������� ������';
Label13.Caption:='���� �������� ������';
end;
end;
end.
