import UIKit
//MARK: - INT (underscore thousand separator in the code)
let population = 8_000
print(population)
//MARK: - Returns a STRINGS in multiple lines
let str1 = """
This goes
over multiple
lines
"""
print(str1)
//MARK: - Array
var colors1 = ["red", "green", "blue","red"]
colors1[0] = "blue"
print(colors1)

//MARK: - Set
var colors: Set<String> = Set(["red", "green", "blue","red"])
print(colors)
colors.insert("gray")
print(colors)

var addressTuple = (house: 555, street: "Taylor Swift Avenue", city: "Nashville")
print(addressTuple.house)
addressTuple.city = "New York"
print(addressTuple)

//MARK: - returns a STRING in just one line (multiple lines in the code)
let str2 = """
This goes \
over just one \
line
"""
print(str2)

//declarar vazio
let dicionario = ["A":1, "B":2,"C":2]
print(dicionario)
//MARK: - enum
enum Activity:String{
    case bored = "hey"
    case running = "você"
    case talking = "ai"
    case singing = "me dá"
}
 
