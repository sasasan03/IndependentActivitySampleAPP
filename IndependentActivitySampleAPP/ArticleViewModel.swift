//
//  ArticleViewModel.swift
//  IndependentActivitySampleAPP
//
//  Created by sako0602 on 2023/07/29.
//

import Foundation

class ArticleViewModol: ObservableObject{
    @Published var articles = [
        Article(name: "りんご", content: "赤くて少し酸っぱい"),
        Article(name: "ぶどう", content: "紫で甘いタネがないやつもある"),
        Article(name: "もも", content: "ピンク色で甘いうまい"),
        Article(name: "レモン", content: "黄色くてめちゃくちゃ酸っぱい")
    ]
}
