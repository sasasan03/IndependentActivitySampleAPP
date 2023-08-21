//
//  ContentView.swift
//  IndependentActivitySampleAPP
//
//  Created by sako0602 on 2023/07/29.
//

import SwiftUI

struct Article: Identifiable{
    let id = UUID()
    var name: String
    var content: String
    var attribute: [Attribute]
}

struct ArticleViewModel {
    let articles = [
        Article(name: "フルーツ１", content: "バナナはお通じによし！", attribute: [.a, .b]),
        Article(name: "フルーツ２", content: "なしはみずみずしくてうまい", attribute: [.b, .f]),
        Article(name: "フルーツ３", content: "オレンジはいまいち", attribute: [.c, .e]),
        Article(name: "フルーツ４", content: "スイカは最高", attribute: [.d, .e]),
        Article(name: "フルーツ５", content: "フルーツトマトはフルーツか？", attribute: [.a, .e]),
        Article(name: "フルーツ６", content: "全てのフルーツ", attribute: [.a, .b, .c, .d, .e, .f])
        ]
    
    func getArticles(for attributes: [Attribute]) -> [Article] {
            return articles.filter { attributes.contains($0.attribute) }
        }
}

struct Attribute: OptionSet, Hashable {
    let rawValue: UInt
    static let a = Attribute(rawValue: 1 << 0)
    static let b = Attribute(rawValue: 1 << 1)
    static let c = Attribute(rawValue: 1 << 2)
    static let d = Attribute(rawValue: 1 << 3)
    static let e = Attribute(rawValue: 1 << 4)
    static let f = Attribute(rawValue: 1 << 5)
   // static let all: Attribute = [.a,.b,.c,.d,.e,.f]
}

extension Attribute: CaseIterable {
    static var allCases: [Attribute]{
        return [.a,.b,.c,.d,.e,.f]//,.all]
    }
    var description: String{
        switch self {
        case .a: return "要素『１』"
        case .b: return "要素『２』"
        case .c: return "要素『３』"
        case .d: return "要素『４』"
        case .e: return "要素『５』"
        case .f: return "要素『６』"
        default: return ""
        }
    }
}

struct ContentView: View {
    
    @State private var attributeStack: [Attribute] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                List(Attribute.allCases, id: \.rawValue) { attribute in
                    HStack {
                        Button {
                            attributeStack.append(attribute)
                        } label: {
                            Text(attribute.description)
                        }
                    }
                }
                Text(attributeStack.description)
                NavigationLink("遷移する") {
                    NextView(selectedAttribute: $attributeStack)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
