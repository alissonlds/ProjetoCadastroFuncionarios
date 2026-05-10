program ProjetoCadastroFuncionariosDass;

uses
  Vcl.Forms,
  Un00001FormCadastroFuncionariosDass in 'Un00001FormCadastroFuncionariosDass.pas' {FormCadastroFuncionariosDass},
  Un00001DmCadastroFuncionariosDass in 'Un00001DmCadastroFuncionariosDass.pas' {Dm00001CadastroFuncionariosDass: TDataModule},
  UnCadastroFuncionariosTypes in 'UnCadastroFuncionariosTypes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormCadastroFuncionariosDass, FormCadastroFuncionariosDass);
  Application.CreateForm(TDm00001CadastroFuncionariosDass, Dm00001CadastroFuncionariosDass);
  Application.Run;
end.
