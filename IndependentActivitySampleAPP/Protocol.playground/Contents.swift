import UIKit

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//🍔Equatable
//🍔Comparable
//
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>🍹P121
//🟩
//protocol SimpleVector {
//    associatedtype Element
//    var x: Element { get set }//予測変換で出てこない
//    var y: Element { get set }
//}
////
//struct VectorFloat: SimpleVector{
//  //  typealias Element = Float
//    var x: Float
//    var y: Float
//}
//
//struct VectorDouble: SimpleVector, CustomStringConvertible {
//    var x, y: Double
//    var description: String{ return "[\(x),\(y)]"}
//    //🟥init(){}を２つ作れば予測変換で初期化の方法が２つ出てくる
//    init(x: VectorDouble.Element, y:VectorDouble.Element){
//        self.x = x
//        self.y = y
//    }
//    init(vectorFloat d: VectorFloat){
//        self.init(x: Double(d.x), y: Double(d.y))
//    }
//}
//🟩
//struct VectorGrade: SimpleVector, CustomStringConvertible {
////    typealias Element = String　//🍔こいつがあるとエラーになる
//    enum Element: String { case A, B, C, D, X }
//    var x: Element
//    var y: Element
//    var description: String { return "[\(x),\(y)]" }
//}
//var a = VectorFloat(x: 10.0, y: 12.0)
//var b = VectorDouble(vectorFloat: a)
//print(b)
//var g = VectorGrade(x: .A, y: .C)
//print(g)

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>🍹P124
//🟩
//protocol TransVector {
//    associatedtype Element
//    var x: Element { get set }
//    var y: Element { get set }
//    func transposed() -> Self
//    static func +(lhs: Self, rhs: Self) -> Self
//}
//
//struct VectorInt: TransVector, CustomStringConvertible {
//    typealias Element = Int
//    var x: Int
//    var y: Int
//
//    func transposed() -> VectorInt {
//        return VectorInt(x: self.y, y: self.x)
//    }
//    static func +(lhs: VectorInt, rhs: VectorInt) -> VectorInt {
//        return VectorInt(x: lhs.x + rhs.x, y: lhs.x + rhs.y)
//    }
//    var description: String{ return "[\(x),\(y)]"}
//}
//
//let a = VectorInt(x: 10, y: 3)
//print(a)
//print(a.transposed())
//print(a)
//let b = VectorInt(x: -1, y: 6)
//❓❓+はどうしてインスタンス化しなくても使えてん？
//🍔二項演算子として認識している。
//print(a + b)
//
////>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>🍹P126
//🟩
//protocol EqVector: Equatable {
//    associatedtype Element: Equatable
//    var x: Element { get set }
//    var y: Element { get set }
//}
//
//struct LabeledPoint: EqVector, CustomStringConvertible{
//    typealias Element = Int
//    var label: String
//    var x: Int
//    var y: Int
//    var description: String { "[\(x),\(y)]" }
//}
//🟩
//struct ShopOnMap: EqVector, CustomStringConvertible{
//    var shop: (name: String, comment: String?)
//    var x, y: Float
//    init(_ s: String, N: Float, E: Float, comment: String? ){
//        self.shop = (name: s, comment: comment)
//        self.x = N
//        self.y = E
//    }
//    var description: String {
//        var r = shop.name + "北緯\(self.x)経緯\(self.y)にあります"
//        if let msg = shop.comment {
//            r += " " + msg
//        }
//        return r
//    }
//    static func == (lhs: ShopOnMap, rhs: ShopOnMap) -> Bool {
//        return lhs.x == rhs.x && lhs.y == rhs.y //&&  lhs.shop == rhs.shop
//    }
//}
//
//let mx:VectorInt.Element = 10
//let a = LabeledPoint(label: "A", x: mx, y: 7)
//var b = LabeledPoint(label: "B", x: 10, y: mx - 3)
//print(a == b)
//b.label = "A"
//print(a == b)
//
//let shop01 = ShopOnMap("あさだ", N: 300.1, E: 200.1, comment: "文房具屋")
//let shop02 = ShopOnMap("朝田", N: 300.1, E: 200.1, comment: "ジャンプ売ってる")
//print(shop01 == shop02)

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>🍹P129
//🐲==は同じであることを確認するものなので、プロパティの一部（この場合はname）だけ比較するのは避けた方が良い
//🟩
//struct Time: Comparable, CustomStringConvertible{
//
//    let hour, min: Int
//
//    static func == (lhs: Time, rhs: Time) -> Bool{
//        return lhs.hour == rhs.hour && lhs.min == rhs.min
//    }
//
//    static func < (lhs: Time, rhs: Time) -> Bool {
//        return lhs.hour < rhs.hour || (lhs.hour == rhs.hour && lhs.min < rhs.min)
//    }
//
//    var description: String {
//        let h = hour < 10 ? "\(hour)" : "\(hour)"
//        let m = min < 10 ? "0\(min)" : "\(min)"
//        return h + ":" + m
//    }
//}
//
//let t1 = Time(hour: 5, min: 00)
//let t2 = Time(hour: 4, min: 10)
//let t3 = Time(hour: 5, min: 3)
//print(t1 == t2)
//print(t3 != t2)
//print(t2 > t1)
//print([t1,t2,t3].sorted())

//🟩
//struct PersonName: Comparable {
//    static func < (lhs: PersonName, rhs: PersonName) -> Bool {
//        return lhs.name.count > rhs.name.count
//    }
//    static func == (lhs: PersonName, rhs: PersonName) -> Bool {
//        return lhs.name == rhs.name
//    }
//
//    var name: String
//}
//
//let sako = PersonName(name: "sako")
//let mako = PersonName(name: "makoto")
//print(sako < mako)

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>🍹P129
//let array = ["a","b","c","d"]
//print(array)
//let arraySlice = array.dropFirst()
//print(arraySlice)
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>あきおさん

//🟩Comparable
//struct Item {
//    let name: String
//    let isChecked: Bool
//}
//let items = [
//    Item(name: "apple", isChecked: true),
//    Item(name: "apple", isChecked: false),
//    Item(name: "banana", isChecked: true),
//    Item(name: "banana", isChecked: false),
//    Item(name: "orange", isChecked: true),
//]
//let uniqueValues = Dictionary<String, Item>(
//    items.map { ($0.name, $0) }, // nameを使ってユニークにする
//    uniquingKeysWith: { first, _ in first }
//).values
//print(uniqueValues)

//Dictionaryの型パラメータは省略できますね
//let uniqueValues = Dictionary(
//    items.map { ($0.name, $0) }, // nameを使ってユニークにする
//    uniquingKeysWith: { first, _ in first }
//).values
//
////重複判定に使うプロパティを1つ指定できるようにしてみました
//extension Array {
//    func unique<Key: Hashable>(keyPath: KeyPath<Element, Key>) -> [Element] {
//        Array(
//            Dictionary(
//                map { ($0[keyPath: keyPath], $0) },
//                uniquingKeysWith: { first, _ in first }
//            ).values
//        )
//    }
//}
//print(items.unique(keyPath: \.name))
//print(items.unique(keyPath: \.isChecked))

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>🍹重要事項
//🍟：＝＝だとEquatableだけでいける。==は同じであることを確認するものなので、プロパティの一部（この場合はname）だけ比較するのは避けた方が良い。
//🧐 ＜も使えるようにしたい。どうすれば？

//🟩struct Person: Equatable {
//    var name: String
//    var age: Int
//}
//
//let sako = Person(name: "さこ", age: 31)
//let mako = Person(name: "まこ", age: 31)
//
//print(sako == mako)
//print(sako < mako)//🍔これはできない
//
//extension Person: Comparable {//🍔stubで(<)しか出て来ない。
//    static func < (lhs: Person, rhs: Person) -> Bool {
//        return lhs.age < rhs.age
//    }
//}

//🟩==はどんな時にtrueを返してほしいのか具体的に書かなければいけない。
//struct Person: Comparable{
//
//    var person: (name: String, age: Int)
//
//    static func < (lhs: Person, rhs: Person) -> Bool {
//        return lhs.person.age < rhs.person.age
//    }
//
//    static func == (lhs: Person, rhs: Person) -> Bool {
//        return lhs.person.name == rhs.person.name &&
//               lhs.person.age == rhs.person.age
//    }
//}
//
//let sako = Person(person: (name: "さこ", age: 31))
//let hiro = Person(person: (name: "さこ", age: 31))
//let mako = Person(person: (name: "まこ", age: 31))
//let masa = Person(person: (name: "まさ", age: 26))
//print(sako.person.age < hiro.person.age)
//print(sako == masa)
//print(sako == mako)
//print(sako > masa)

//============================================CustomStringConvertible
//🟩
//struct Person{//: CustomStringConvertible{
//    let name: String
//  //  var description: String { return "name is \(name)" }
//}
//
//let sako = Person(name: "sako")
//print(sako)

//🟩
//struct Point{
//    var number: Int
//}
//
//extension Point: CustomStringConvertible{
//    var description: String {
//        return "入力した数字は\(number)です"
//    }
//}
//
//let numbwe3 = Point(number: 3)
//print(numbwe3)

//🟩
//struct Person {
//    var name: String
//    struct age: CustomStringConvertible {
//        let int: Int
//        var description: String{
//            return "\(int)さい"
//        }
//    }
//}
//
//let sako = Person.age(int: 11)
//print(sako)
//let mako = Person(name: "まさ")
//print(mako)


//============================================RawRepresentable
//🟩


