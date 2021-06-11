import UIKit

let caloria1 = 50.5
let caloria2 = 100
let caloria3 = 300
let caloria4 = 500

//MARK: - Array = lista
//declação
let totalCalorias = [50.5, 100, 300, 500]
print(totalCalorias)
//primeira forma
for i in 0...3{
    print(totalCalorias[i])
}
//segunda forma
for i in 0...totalCalorias.count-1{
    print(totalCalorias[i])
}
//terceira forma > mais utilizada
for caloria in totalCalorias{
    print(caloria)
}
