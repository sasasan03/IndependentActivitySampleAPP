import Foundation

//🟥Setの実験
//🍔数字
//let nums =  Set(0..<8)
//for num in nums {
//    print(num, terminator: "　")
//}
//nums.first//3を出力

//🍔文字
//let fruits: Set<String> = ["remon", "apple", "grap", "peach"]
//for fruit in fruits {
//    print(fruit, terminator:  "　")
//}

//🍔重複を避ける
//let alphabets: Set<String> = ["a","b","a","c","d"]
//for alp in alphabets {
//    print(alp, terminator: "　")
//}

//🍔データモデル型はどうなの？
struct Person: Hashable {
    let name: String
    let age: Int
}

let persons: Set<Person> = [
    Person(name: "ひろ", age: 31),
    Person(name: "ひろ", age: 31),
    Person(name: "まこ", age: 30),
    Person(name: "ままこ", age: 30),
    Person(name: "まさ", age: 29),
    Person(name: "まさ", age: 28)
    
]
for person in persons {
    print(person, terminator: "🍹")
}

//🍔シーケンス型を引数にできるだと！？
//let drinks = Set<String>(["bear","wine","sake"])
//print(drinks)
