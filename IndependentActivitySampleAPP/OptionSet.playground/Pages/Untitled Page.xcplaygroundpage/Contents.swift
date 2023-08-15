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

//enum Direction: String { //🍹RawValueがStringでも大丈夫🙆
//    case up = "アップ", down = "ダウン", rigth = "ライト", left = "レフト"
//}
//
//let a = Direction.rigth
//print(a)//rigth
//let i = a.rawValue
//print(i)//4
//
//let k = Direction.down.rawValue

//🍔値型の列挙型による改良版（方向を表すケースを時計回りの順に定義すれば、switch文で全てを列挙する必要はなくなる。）
//enum Direction: Int {
//    case up = 1, down, rigth, left
//    func clockwise() -> Direction{
//        let t = (self.rawValue + 1) % 4
//        return Direction(rawValue: t)!
//    }
//}
//
//let d = Direction.down
//print(d.rawValue)
//print(d.clockwise().rawValue)


//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>あきおさんのサンプルコード

struct Article {}
//1️⃣OptionSetに適合させる
//2️⃣RawRepresentableに適合させる。(OptionSetはRawRepresentableを継承している)
//3️⃣静的プロパティで項目を定義。
struct Attribute: OptionSet, Hashable {
    let rawValue: UInt
    static let a = Attribute(rawValue: 1 << 0)//１を０ビット左にシフト
    static let b = Attribute(rawValue: 1 << 1)//１を１ビット左にシフト
    static let c = Attribute(rawValue: 1 << 2)//１を２ビット左にシフト
    static let d = Attribute(rawValue: 1 << 3)//１を３ビット左にシフト
}

let b1: Attribute = .a
let b2: Attribute = .b
let b3: Attribute = .c
let b4: Attribute = .d
print(b1.rawValue)//1
print(b2.rawValue)//2
print(b3.rawValue)//4
print(b4.rawValue)//8

let a1: Attribute = [.a, .b]
let a2: Attribute = [.a, .d]
let a3: Attribute = [.a, .a, .b]
print(a3.rawValue)//3🟥rawValueはかぶっていてもええの？🟦数値自体はそない大事ではない。

a1.union(a2).contains(.a)//true
a1.union(a2).contains(.b)//true
a1.union(a2).contains(.c)//false
a1.union(a2).contains(.d)//true

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


var attributeStack: [Attribute] = []
attributeStack.append(.a)
print(attributeStack)
attributeStack.append([.b,.c])
