menu :-
  writeln('-------------------------------- Controle de Animais ---------------------------
Escolha uma opção
1 - Cadastrar Animal
2 - Atualizar Animal
3 - Listar Animais
4 - Buscar Animal
5 - Sair').

gerarBd([]).

recebeEntrada(Prompt, Entrada) :- 
  write(Prompt),
  write(': '),
  read(Entrada).

insereFim(T, [H], L):-insere(H, [T], L). 
insereFim(N, [H|T], L):-insereFim(N, T, X), insere(H, X, L).

cadastra(Bd) :-
  recebeEntrada('Digite o ID do animal', Id),
  recebeEntrada('Digite o tamanho do animal(P, M ou G)', Tamanho),
  recebeEntrada('Digite o gênero do animal', Genero),
  recebeEntrada('Digite a cor do animal', Cor),
  recebeEntrada('Digite o tipo do animal', Tipo),
  recebeEntrada('Digite o dono do animal', Dono),
  recebeEntrada('Digite a observação do animal', Observacao),
  insereFim([Id, Tamanho, Genero, Cor, Tipo, Dono, Observacao], Bd, Retorno),
  inicio(Retorno).

atualiza(Bd) :-
  listar(Bd),
  receberEntrada('Digite o Indice do animal na Lista: ', Indice),
  writeln('Escolha uma opção 
1 - Atualizar tamanho
2 - Atualizar Obs'),
  receberEntrada('Digite a Opcao: ', Op),
  atualizaBd(Bd, Op, IdProcurado).

atualizaBd(Bd, Op, IdProcurado) :-
  Op =:= 1 -> setTamanho(Bd, IdProcurado);
  Op =:= 2 -> setObs(Bd, IdProcurado).

setTamanho(Bd) :-
  recebeEntrada('Digite o novo tamanho do animal: ', NovoTamanho),
  

setObs(Bd, IdProcurado, Retorno):-

inicio() :-
  recebeEntrada('Digite a Opcao', Opcao),
  seleciona(Opcao).

seleciona(Opcao, Bd) :-
  Opcao =:= 1 -> cadastra(Bd);
  Opcao =:= 2 -> atualiza(Bd);
  Opcao =:= 3 -> listar(Bd);
  Opcao =:= 4 -> busca(Bd);
  Opcao =:= 5 -> sair().

:- initialization(main).
main :-
  menu(),
  gerarBd(Bd),
  inicio(Bd).
  
