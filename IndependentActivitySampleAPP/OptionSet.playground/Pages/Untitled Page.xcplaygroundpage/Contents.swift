//: [Previous](@previous)

import Foundation

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
