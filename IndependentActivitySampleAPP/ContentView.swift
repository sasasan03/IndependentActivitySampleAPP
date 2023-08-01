//
//  ContentView.swift
//  IndependentActivitySampleAPP
//
//  Created by sako0602 on 2023/07/29.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ArticleViewModol()
    
    var body: some View {
        VStack {
            
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
