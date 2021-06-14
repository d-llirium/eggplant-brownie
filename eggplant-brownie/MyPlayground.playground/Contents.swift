import UIKit

class Refeicao{
    //MARK: - atributos
    var nome: String
    var felicidade: String
    //inicializada vazia
    var itens: Array<Item> = []
    //MARK: - construtor
    //os tipos precisam estar explícitos na hora de colocar os parametros
    init(nome:String,felicidade:String){
        self.nome = nome
        self.felicidade = felicidade
    }
    //MARK: - métodos
    func totalDeCalorias() -> Double{
        var total = 0.0
        
        for item in itens {
            total += item.calorias
        }
        return total
    }
}
class Item{
    //MARK: - atributos
    var nome: String
    var calorias:Double
    //MARK: - construtor
    init(nome: String, calorias:Double){
        self.nome = nome
        self.calorias = calorias
    }
}
let refeicao = Refeicao(nome: "Almoço", felicidade: "5")


let arroz = Item(nome: "Arroz", calorias: 51.0)
let feijao = Item(nome: "Feijão", calorias: 90.0)
let contraFile = Item(nome: "Contra Filé", calorias: 287.0)
//adds at the end
refeicao.itens.append(arroz)
refeicao.itens.append(feijao)
refeicao.itens.append(contraFile)
print(refeicao.nome)

//print(refeicao.itens.first?.nome) //opcional, pq a lista foi inicializada vazia
if let primeiroItemDaLista = refeicao.itens.first{
    print(primeiroItemDaLista.nome)
}
print(refeicao.totalDeCalorias())
