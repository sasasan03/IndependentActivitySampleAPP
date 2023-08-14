//
//  NextView.swift
//  IndependentActivitySampleAPP
//
//  Created by sako0602 on 2023/08/14.
//

import SwiftUI

struct NextView: View {
    
    @ObservedObject var articleViewModel: ArticleViewModel
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Hello, World!")
                Text("やあやあ")
            }
        }
    }
}

struct NextView_Previews: PreviewProvider {
    static var previews: some View {
        NextView(articleViewModel: ArticleViewModel())
    }
}
