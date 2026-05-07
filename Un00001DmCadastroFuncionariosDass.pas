unit Un00001DmCadastroFuncionariosDass;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDm00001CadastroFuncionariosDass = class(TDataModule)
    FdConexaoProjeto: TFDConnection;
    FdLink: TFDPhysFBDriverLink;
    FdTabelaFuncionarios: TFDTable;
    FdTabelaFuncionariosID: TIntegerField;
    FdTabelaFuncionariosNOME: TStringField;
    FdTabelaFuncionariosCPF: TStringField;
    FdTabelaFuncionariosEMAIL: TStringField;
    FdTabelaFuncionariosTAMANHO_CAMISA: TStringField;
    FdTabelaFuncionariosTAMANHO_CALCADO: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dm00001CadastroFuncionariosDass: TDm00001CadastroFuncionariosDass;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TDm00001CadastroFuncionariosDass.DataModuleCreate(Sender: TObject);
begin
//
end;



end.
