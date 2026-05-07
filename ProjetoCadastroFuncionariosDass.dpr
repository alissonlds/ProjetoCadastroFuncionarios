program ProjetoCadastroFuncionariosDass;

uses
  Vcl.Forms,
  Un00001FormCadastroFuncionariosDass in 'Un00001FormCadastroFuncionariosDass.pas' {FormCadastroFuncionariosDass},
  Dm00001CadastroFuncionariosDass in 'Dm00001CadastroFuncionariosDass.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormCadastroFuncionariosDass, FormCadastroFuncionariosDass);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
