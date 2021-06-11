import UIKit

let totalDeCalorias: [Double] = [50.5,100]

func somaTodasCalorias(totalDeCalorias: [Double]) -> Double{
    var total = 0.0
    for  caloria in totalDeCalorias{
        total += caloria
    }
    return total
}
let total = somaTodasCalorias(totalDeCalorias: [50.5, 100, 300])
print(total)
