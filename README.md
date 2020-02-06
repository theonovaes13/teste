README
--------------------------------------------------------------------------------------
Aplicação em Rails 
--------------------------------------------------------------------------------------
Sua função é implementar a criação de contas de e-mail para alunos da UFF. 
Para isso, será necessário criar um usuário com e-mail e senha, percorrer o banco de dados que contém os dados dos alunos e checar se o e-mail utilizado pertence ao banco de dados. Seja o caso, é necessário, de acordo com o nome do aluno, oferecer um conjunto de opções de e-mail para ele escolher. 
Ao final do processo, o aluno recebe uma mensagem informando que sua conta será atualizada nos próximos minutos e que ele receberá um SMS/e-mail com sus informações de acesso. 
Este processo apenas ocorrerá caso o aluno não possua um IDUFF. Caso já o possua, ele será redirecionado à página que mostra suas informações.

* Regras:
  * As opções de UFFMail devem ser geradas de acordo com o nome do aluno
  * Um aluno só pode ter um UFFMail
  
  **Para acessar a lista de alunos, insira o link '/students/index' após localhost:3000**


