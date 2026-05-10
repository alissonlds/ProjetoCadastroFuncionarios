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
  CSqlConsultaPadrao =
    'SELECT ID, NOME, CPF, EMAIL, TAMANHO_CAMISA, TAMANHO_CALCADO ' + sLineBreak
    + 'FROM FUNCIONARIOS ' + sLineBreak + 'WHERE 1=1' + sLineBreak + '%0:S' +
    sLineBreak + '%1:S' + sLineBreak + '%2:S' + sLineBreak + '%3:S' +
    sLineBreak + '%4:S';
  // Se você for usar para Insert/Update depois
  CSqlInsert =
    'INSERT INTO FUNCIONARIOS (NOME, CPF, EMAIL, TAMANHO_CAMISA, TAMANHO_CALCADO) '
    + 'VALUES (:pNome, :pCpf, :pEmail, :pCamiseta, :pCalcado)';

  CCondicaoNome = 'AND FUNCIONARIOS.NOME = %0:S';
  CCondicaoEmail = 'AND FUNCIONARIOS.EMAIL = %0:S';
  CCondicaoCpf = 'AND FUNCIONARIOS.CPF = %0:S';
  CCondicaoTamCamiseta = 'AND FUNCIONARIOS.TAMANHO_CAMISA = %0:S';
  CCondicaoTamCalcado = 'AND FUNCIONARIOS.TAMANHO_CALCADO = %0:D';

implementation

end.
