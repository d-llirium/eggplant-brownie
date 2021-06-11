import UIKit
//criar a primeira refeição
let nome: String = "Macarrão"
let felicidade: String = "5"
//criar a segunda refeição
let nome2: String = "Churros"
let felicidade2: String = "4"
//--------------------------
//MARK: - classe (estrutura para agrupar as características)
class Refeicao{
    var nome: String = "Macarrão"
    let felicidade: String = "5"
}
//referncia/instancia/chama a classe EXPLICITO
let refeicao: Refeicao = Refeicao()
//refeicao não pode ser de outro tipo pq é constante, mas o atributo nome é uma variável, portanto pode ser modificado
refeicao.nome = "Feijão"
//referncia/instancia/chama a classe Implicita
let reificaoImplicita = Refeicao()
print(refeicao.nome)

class Refeicao2{
    var nome: String = "Churros"
    var felicidade: String = "4"
}
var refeicao2 = Refeicao2()
print(refeicao2.nome)
