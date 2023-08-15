//
//  ArticleView.swift
//  IndependentActivitySampleAPP
//
//  Created by sako0602 on 2023/08/15.
//

import SwiftUI

struct ArticleView: View {
    
    let article: Article
    
    var body: some View {
        //NavigationStack{
        Text(article.content)
        //}
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article(name: "フルーツ１", content: "ぶどうはうまい", attribute: .a))
    }
}
