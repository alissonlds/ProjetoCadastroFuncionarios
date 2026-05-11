program ProjetoCadastroFuncionariosDass;

uses
  Vcl.Forms,
  Un00001FormCadastroFuncionariosDass in 'Un00001FormCadastroFuncionariosDass.pas' {FormCadastroFuncionariosDass},
  Un00001DmCadastroFuncionariosDass in 'Un00001DmCadastroFuncionariosDass.pas' {DmCadastroFuncionariosDass: TDataModule},
  UnCadastroFuncionariosTypes in 'UnCadastroFuncionariosTypes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormCadastroFuncionariosDass, FormCadastroFuncionariosDass);
  Application.CreateForm(TDmCadastroFuncionariosDass, DmCadastroFuncionariosDass);
  Application.Run;
end.
