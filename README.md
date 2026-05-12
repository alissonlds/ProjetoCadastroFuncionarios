==========================================================================
SISTEMA DE GESTÃO DE FUNCIONÁRIOS - LEIA-ME
==========================================================================

Este projeto foi desenvolvido em Delphi 12 Community Edition e Firebird 3.0.
A estrutura de pastas e scripts foi organizada para facilitar a configuração.

1. REQUISITOS DE AMBIENTE
-------------------------
* IDE: Delphi 12 Community Edition.
* Banco de Dados: Firebird 3.0 instalado (64 ou 32 bits).
* Conexão: FireDAC.

2. CONFIGURAÇÃO DA BASE DE DADOS
--------------------------------
O repositório já contém a pasta necessária para hospedar o banco de dados.
Siga os passos abaixo para criar o arquivo físico:

1. Localize o arquivo de script:
   C:\Projetos\Projeto Cadastro Funcionarios Dass\SCRIPT_DB.SQL

2. Abra seu gerenciador de banco de dados (IBExpert, FlameRobin, etc).

3. Execute o script 'SCRIPT_DB.SQL'. 
   IMPORTANTE: Certifique-se de que o comando CREATE DATABASE no script 
   aponte para o diretório de dados do repositório:
   'C:\Projetos\Projeto Cadastro Funcionarios Dass\Base de dados\FUNCIONARIOS_DASS.FDB'

4. O script irá criar automaticamente:
   - A tabela 'FUNCIONARIOS';
   - O Generator 'GEN_FUNCIONARIOS_ID';
   - 10 registros de teste com CPFs válidos (apenas números).

3. CONFIGURAÇÃO NA APLICAÇÃO (DELPHI)
-------------------------------------
A aplicação já está pré-configurada para buscar o banco de dados no 
caminho padrão do repositório.

1. Abra o projeto no Delphi 12.
2. No DataModule, verifique se o componente 'TFDConnection' está apontando 
   corretamente para:
   'C:\Projetos\Projeto Cadastro Funcionarios Dass\Base de dados\FUNCIONARIOS_DASS.FDB
3. Compile e execute (F9).

4. PADRÕES DO PROJETO
---------------------
* NOME: Gravados sempre em CAIXA ALTA (Upper Case).
* CPF: Validado matematicamente e gravado SEM pontos ou traços (11 dígitos).
* EMAIL: Validado um padrão mínimo de caracteres para gravação.
* ID: Gerado automaticamente via Generator (GEN_ID) no banco de dados.
* TAMANHO_CAMISA: Tamanhos conforme solicitado.
* TAMANHO_CALCADO: Validado tamanhos reais.
* Consulta da listagem realizada com qualquer campo preenchido ou todos vazios (todos registros).
 ** Validado CPF e E-Mail válidos para consulta também. 
==========================================================================
Repositório: https://github.com/alissonlds/ProjetoCadastroFuncionarios.git
Desenvolvido por: [Alisson Lemes de Souza]
==========================================================================
