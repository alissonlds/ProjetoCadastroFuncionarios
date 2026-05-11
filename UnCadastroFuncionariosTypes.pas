unit UnCadastroFuncionariosTypes;

interface

type
  TFiltrosFuncionario = record
    Nome: string;
    Cpf: string;
    Email: string;
    TamCamiseta: string;
    TamCalcado: Integer;
  end;

Const
{$REGION 'SQL de consultas'}
  CSqlConsultaPadrao =
    'SELECT ID, NOME, CPF, EMAIL, TAMANHO_CAMISA, TAMANHO_CALCADO ' + sLineBreak
    + 'FROM FUNCIONARIOS ' + sLineBreak + 'WHERE 1=1' + sLineBreak + '%0:S' +
    sLineBreak + '%1:S' + sLineBreak + '%2:S' + sLineBreak + '%3:S' +
    sLineBreak + '%4:S';

  CCondicaoNome = 'AND FUNCIONARIOS.NOME = ''%0:S''';
  CCondicaoEmail = 'AND FUNCIONARIOS.EMAIL = ''%0:S''';
  CCondicaoCpf = 'AND FUNCIONARIOS.CPF = ''%0:S''';
  CCondicaoTamCamiseta = 'AND FUNCIONARIOS.TAMANHO_CAMISA = ''%0:S''';
  CCondicaoTamCalcado = 'AND FUNCIONARIOS.TAMANHO_CALCADO = %0:D';
{$ENDREGION}

implementation

end.
