//
//  ContentView.swift
//  IndependentActivitySampleAPP
//
//  Created by sako0602 on 2023/07/29.
//

import SwiftUI

struct Article{
    var name: String
    var content: String
}

class ArticleViewModel: ObservableObject {
    @Published var articles = [
        Article(name: "フルーツ１", content: "バナナはお通じによし！"),
        Article(name: "フルーツ２", content: "なしはみずみずしくてうまい"),
        Article(name: "フルーツ３", content: "オレンジはいまいち"),
        Article(name: "フルーツ４", content: "スイカは最高"),
        Article(name: "フルーツ５", content: "フルーツトマトはフルーツか？"),
        Article(name: "フルーツ６", content: "全てのフルーツについて")
    ]
}

struct Attribute: OptionSet, Hashable {
    let rawValue: UInt
    static let a = Attribute(rawValue: 1 << 0)
    static let b = Attribute(rawValue: 1 << 1)
    static let c = Attribute(rawValue: 1 << 2)
    static let d = Attribute(rawValue: 1 << 3)
    static let e = Attribute(rawValue: 1 << 4)
    static let f = Attribute(rawValue: 1 << 5)
    
    static let all: Attribute = [.a,.b,.c,.d,.e,.f]
}

struct ContentView: View {
    
    var body: some View {
        NavigationStack{
            VStack {
                
                Text("Hello, world!")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
