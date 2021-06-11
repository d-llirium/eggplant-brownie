import UIKit

class Refeicao{
    //opcionais = pode ou não ter valor
    var nome: String?
    var felicidade: String?
}
//referncia/instancia/chama a classe
let refeicao = Refeicao()
//refeicao.nome = "Macarrão"

//MARK: - forced unwrap CUIDADO
//evitando CRASH
//se não for nula, ela imprime, caso seja nula não imprime e tb não dá CRASH
if refeicao.nome != nil {
    print(refeicao.nome!)
}
//MARK: - if let
//cria uma constante nome se existir valor na variável opcional e evita usar o unwrap > mais seguro
//mas a constante só pode ser usada dentro do scopo do if
if let nome = refeicao.nome{
    print(nome)
}
//MARK:- guard let
//a constante existe até o método acabar
func exibeNomeDaRefeicao(){
    //no if let a constante só pode ser usada dentro do scopo do if
    if let nome = refeicao.nome{
        print(nome)
    }
    //no guard let a constante pode ser usada dentro do scopo do método
    guard let nome = refeicao.nome else{
        return
    }
    print(nome)
}
//invocando o método
exibeNomeDaRefeicao()
