//: [Previous](@previous)

import Foundation
//🍔シンプルな列挙型
//enum Direction {
//    case up, down, rigth, left
//}
//let down = Direction.down
//let up: Direction = .up
//print(down == up)

//🍔値型の列挙型
//enum Direction: Int {//🍹型アノテーションの指定は必須
//    case up = 2, down, rigth, left
//}
//
//let a = Direction.rigth
//print(a)//rigth
//let i = a.rawValue
//print(i)//4

enum Direction: String { //🍹RawValueがStringでも大丈夫🙆
    case up = "アップ", down = "ダウン", rigth = "ライト", left = "レフト"
}

let a = Direction.rigth
print(a)//rigth
let i = a.rawValue
print(i)//4

let k = Direction.down.rawValue



struct Article {}

struct Attribute: OptionSet, Hashable {
    let rawValue: UInt
    static let a = Attribute(rawValue: 1 << 0)
    static let b = Attribute(rawValue: 1 << 1)
    static let c = Attribute(rawValue: 1 << 2)
    static let d = Attribute(rawValue: 1 << 3)
}


let a1: Attribute = [.a, .b]
let a2: Attribute = [.a, .d]

a1.union(a2).contains(.a)
a1.union(a2).contains(.b)
a1.union(a2).contains(.c)
a1.union(a2).contains(.d)


a1.contains(.a)
a1.contains(.b)
a1.contains(.c)
a1.contains(.d)

let relations: [Attribute: [Article]] = [
    [.a, .b, .c]: [Article()],
    [.a]: [Article(), Article(), Article()],
    [.c]: [Article(), Article()],
]


relations[[.a]]
relations[[.c]]
relations[[.d]]
relations[[.a, .b, .c]]
