import UIKit

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>🍹P121
//protocol SimpleVector {
//    associatedtype Element
//    var x: Element { get set }//予測変換で出てこない
//    var y: Element { get set }
//}
//
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
//
//struct VectorGrade: SimpleVector, CustomStringConvertible {
////    typealias Element = String　//🍟こいつがあるとエラーになる
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
protocol TransVector {
    associatedtype Element
    var x: Element { get set }
    var y: Element { get set }
    func transposed() -> Self
    static func +(lhs: Self, rhs: Self) -> Self
}

struct VectorInt: TransVector, CustomStringConvertible {
    typealias Element = Int
    var x: Int
    var y: Int
    
    func transposed() -> VectorInt {
        return VectorInt(x: self.y, y: self.x)
    }
    static func +(lhs: VectorInt, rhs: VectorInt) -> VectorInt {
        return VectorInt(x: lhs.x + rhs.x, y: lhs.x + rhs.y)
    }
    var description: String{ return "[\(x),\(y)]"}
}

let a = VectorInt(x: 10, y: 3)
print(a)
print(a.transposed())
print(a)
let b = VectorInt(x: -1, y: 6)
//❓❓+はどうしてインスタンス化しなくても使えてん？
//🍔二項演算しとして認識している。
print(a + b)


