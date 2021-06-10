import UIKit
//Este é o código principal do nosso projeto
//MARK: - atributos
let nome = "churros"
let felicidade = 5
let calorias = 79.5
let vegetal = false
//MARK: - métodos
//método sem parâmetro
func alimentoConsumido(){
    print("1.O alimento consumido foi: \(nome)")
}
//instanciando/chamando
alimentoConsumido()
//método com parâmetro
func alimentoConsumido(nome: String, caloria: Double){
    print("2.O alimento consumido foi: \(nome), com calorias: \(caloria)")
}
//instanciando/chamando
alimentoConsumido(nome: nome, caloria: calorias)
//para ocultar o nome dos parâmetros nas hora de invocar
func alimentoConsumido(_ nome: String, _ caloria: Double){
    print("3.O alimento consumido foi: \(nome), com calorias: \(caloria)")
}
//instanciando/chamando
alimentoConsumido(nome,calorias)
