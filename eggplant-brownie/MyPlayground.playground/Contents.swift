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
    //opcionais = pode ou não ter valor
    var nome: String?
    var felicidade: String?
}
//referncia/instancia/chama a classe
let refeicao = Refeicao()
refeicao.nome = "Macarrão"
//como é opcional, ele vai sempre imprimir com o Opcional("....")
print(refeicao.nome)

//MARK: - forced unwrap CUIDADO
//se não tiver uma variável associada e dar unwrap, o app vai dar CRASH
print(refeicao.nome!)
