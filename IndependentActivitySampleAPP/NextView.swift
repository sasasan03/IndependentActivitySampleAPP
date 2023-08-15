//
//  NextView.swift
//  IndependentActivitySampleAPP
//
//  Created by sako0602 on 2023/08/14.
//

import SwiftUI

struct NextView: View {
    
    let viewModel = ArticleViewModel()
    @Binding var selectedAttribute: [Attribute]
    
    var body: some View {
        NavigationStack{
            List(viewModel.getArticles(for: selectedAttribute), id: \.id){ article in
                HStack{
                    Text(article.name)
                    NavigationLink {
                        ArticleView(article: article)
                    } label: {
                        
                    }
                }
            }
        }
    }
}


struct NextView_Previews: PreviewProvider {
    static var previews: some View {
        NextView(selectedAttribute: Binding<[Attribute]>.constant([Attribute.a]))
    }
}
