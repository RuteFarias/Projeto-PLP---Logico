-- Animal (Id, Tamanho, Genero, Cor, Tipo, Dono, Obs) 
data Animal = Animal Int String String String String String String 

idAnimal :: Animal -> Int
idAnimal (Animal id _ _ _ _ _ _ ) = id

setTamanho (Animal id tam gen cor tipo dono obs ) otherTam = Animal id otherTam gen cor tipo dono obs

setObs (Animal id tam gen cor tipo dono obs) otherObs = Animal id tam gen cor tipo dono otherObs 

toString (Animal id tam gen cor tipo dono obs) = "Animal(" ++ "Id: " ++ show id ++ ", Tamanho: " ++ tam ++ ", Gênero: " ++ gen ++ ", Cor: " ++ cor ++ ", Tipo: " ++ tipo ++ ", Dono: " ++ dono ++ ", Obs: " ++ obs ++ ")" 

existeAnimal :: [Animal] -> Int -> Bool
existeAnimal [] _ = False
existeAnimal animais id
	| (idAnimal (head animais) == id) = True
	| otherwise = existeAnimal (tail animais) id

adicionarAnimal :: [Animal] -> Animal -> [Animal]
adicionarAnimal animais animal 
	| existeAnimal animais (idAnimal animal) = animais
	| otherwise =  animais ++ [animal]

editarTamanhoAnimal :: [Animal] -> Int -> String -> [Animal]
editarTamanhoAnimal [animal] id tamanho
	| idAnimal animal == id = [setTamanho animal tamanho]
	| otherwise = [animal]


editarTamanhoAnimal animais id tamanho
	| idAnimal (head animais) == id = [setTamanho (head animais) tamanho] ++ (tail animais)
	| otherwise = [head animais] ++ editarTamanhoAnimal (tail animais) id tamanho


editarObsAnimal :: [Animal] -> Int -> String -> [Animal]
editarObsAnimal [animal] id obs
	| idAnimal animal == id = [setObs animal obs]
	| otherwise = [animal]


editarObsAnimal animais id obs
	| idAnimal (head animais) == id = [setObs (head animais) obs] ++ (tail animais)
	| otherwise = [head animais] ++ editarTamanhoAnimal (tail animais) id obs



listarAnimais :: [Animal] -> String
listarAnimais [] = "Nenhum animal cadastrado.\n"
listarAnimais [animal] = (toString animal ++ "\n")
listarAnimais animais = (toString (head animais) ++ "\n" ++ (listarAnimais (tail animais)))


buscarAnimal :: [Animal] -> Int -> String
buscarAnimal [] _ = "Animal inexistente.\n"
buscarAnimal animais id
	| (idAnimal (head animais) == id) = toString (head animais) ++ "\n"
	| otherwise = buscarAnimal (tail animais) id

animalCadastrado :: Bool -> String
animalCadastrado existe
    | existe == True = "ID de animal já cadastrado, tente novamente.\n"
    | otherwise = "Animal cadastrado com sucesso.\n"

atualizar '1' animais id = do 
	putStr "Digite o novo tamanho do animal: "
	tam <- getLine
	putStrLn ""
	menu (editarTamanhoAnimal animais (read id :: Int) tam)

atualizar '2' animais id = do 
	putStr "Digite o nova observacao do animal: "
	obs <- getLine
	putStrLn ""
    menu (editarObsAnimal animais (read id :: Int) obs)

executarOpcao '1' animais = do
    putStrLn ""
    putStr "Digite o ID do animal: " 
    id <- getLine
    putStr "Digite o tamanho do animal(P, M ou G): " 
    tam <- getLine
    putStr "Digite o gênero do animal: " 
    gen <- getLine
    putStr "Digite a cor do animal: " 
    cor <- getLine
    putStr "Digite o tipo do animal: " 
    tipo <- getLine
    putStr "Digite o dono do animal: " 
    dono <- getLine
    putStr "Digite a observação do animal: " 
    obs <- getLine
    putStrLn ""   
    putStr (animalCadastrado (existeAnimal animais (read id :: Int)))
    menu (adicionarAnimal animais (Animal (read id :: Int) tam gen cor tipo dono obs))
    
executarOpcao '2' animais = do
    putStrLn ""
    putStr "Digite o ID do animal: "
    id <- getLine
    putStrLn ""
    putStrLn "Escolha uma opção "
    putStrLn "1 - Atualizar tamanho"
    putStrLn "2 - Atualizar Obs"
    opc <- getChar
    putStrLn ""
    atualizar opc animais id
	
executarOpcao '3' animais = do
	putStrLn ""
	putStr (listarAnimais animais)
	putStrLn ""
	menu animais
	
executarOpcao '4' animais = do
	putStrLn ""
	putStr "Digite o ID do animal: "
	id <- getLine
	putStrLn ""
	putStr (buscarAnimal animais (read id :: Int))
	putStrLn ""
	menu animais

executarOpcao _ animais = do
	menu animais

menu animais = do
	putStrLn "-------------------------------- Controle de Animais --------------------------------"
	putStrLn "Escolha uma opção "
	putStrLn "1 - Cadastrar Animal"
	putStrLn "2 - Atualizar Animal"
	putStrLn "3 - Listar Animais"
	putStrLn "4 - Buscar Animal"
	putStrLn ""
	putStrLn "Digite sua opção: "
	putStr "Opção: "
	op <- getChar
	putStrLn ""
	executarOpcao op animais

iniciar = do
	menu []
