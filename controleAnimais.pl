menu :-
  nl, writeln('-------------------------------- Controle de Animais ---------------------------
Escolha uma opção
1 - Cadastrar Animal
2 - Listar Animais
3 - Buscar Animal
4 - Sair').

gerarBd([]).

recebeEntrada(Prompt, Entrada) :- 
  write(Prompt),
  write(': '),
  read(Entrada).

insere(X, L, [X|L]).

cadastra(Bd) :-
  recebeEntrada('Digite o ID do Animal', Id),
  recebeEntrada('Digite o tamanho do Animal(P, M ou G)', Tamanho),
  recebeEntrada('Digite o gênero do Animal', Genero),
  recebeEntrada('Digite a cor do Animal', Cor),
  recebeEntrada('Digite o tipo do Animal', Tipo),
  recebeEntrada('Digite o dono do Animal', Dono),
  recebeEntrada('Digite a observação do Animal', Observacao),
  insere([Id, Tamanho, Genero, Cor, Tipo, Dono, Observacao], Bd, Retorno),
  inicio(Retorno).

atualiza(Bd) :-
  listar(Bd),
  recebeEntrada('Digite o Indice do Elem na Lista: ', Indice),
  writeln('Escolha uma opção 
  1 - Atualizar tamanho
  2 - Atualizar Obs'),
  recebeEntrada('Digite a Opcao: ', Op),
  atualizaBd(Bd, Op, Indice).

atualizaBd(Bd, Op, Indice) :-
  Op =:= 1 -> setTamanho(Bd, Indice);
  Op =:= 2 -> setObs(Bd, Indice).

getInd(Elemento,Lista,Index) :- nth0(Index, Lista, Elemento).

  insere([Id, NovoTamanho, Genero, Cor, Tipo, Dono, Observacao], Bd, Retorno),
  inicio(Retorno). 

  remove_index([],_,_,_).

  remove_index([H|T],Index,[NH|NT],Cont) :-
    Cont_N = Cont + 1,
    (Cont + 1 == Index -> remove_index(T,Index,NT,Cont_N);
    remove_index(T,Index,NH,Cont_N)).

listar(Bd) :-
  writeln(Bd),
  inicio(Bd).

inicio(Bd) :-
  menu(),
  recebeEntrada('Digite a Opção', Opcao),
  seleciona(Opcao, Bd).

seleciona(Opcao, Bd) :-
  Opcao =:= 1 -> cadastra(Bd);
  Opcao =:= 2 -> listar(Bd);
  Opcao =:= 3 -> busca(Bd);
  Opcao =:= 4 -> halt(0). 

busca(Bd) :-
   recebeEntrada('Digite o Índice', Index),
   nth0(Index, Bd, Elem),
 
  getInd(Id, Elem, 0),
  getInd(Tamanho, Elem, 1),
  getInd(Genero, Elem, 2),
  getInd(Cor, Elem, 3),
  getInd(Tipo, Elem, 4),
  getInd(Dono, Elem, 5),
  getInd(Obs, Elem, 6),


   nl,write('ID: '),write(Id),
   write(', Tamanho: '),write(Tamanho),
   write(', Genero: '),write(Genero),
   write(', Cor: '),write(Cor),
   write(', Tipo: '),write(Tipo),
   write(', Dono: '),write(Dono),
   write(', Observação: '),write(Obs),nl,
   inicio(Bd).
 

:- initialization(main).
main :-
  shell('clear'),  
  gerarBd(Bd), 
  inicio(Bd),
  halt(0).
  
