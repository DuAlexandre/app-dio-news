//
//  NewsModel.swift
//  AppDIONews
//
//  Created by Eduardo Alexandre on 26/01/23.
//

import Foundation

struct NewsModel {
    var source: SourceModel
    var author: String?
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: Date
    var content: String?
}
