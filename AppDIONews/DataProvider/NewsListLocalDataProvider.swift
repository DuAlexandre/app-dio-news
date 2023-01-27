//
//  NewsListLocalDataProvider.swift
//  AppDIONews
//
//  Created by Eduardo Alexandre on 26/01/23.
//

import Foundation

protocol NewsListLocalDataProviderProtocol: GenericDataProvider { }

class NewsListLocalDataProvider: DataProviderManager<NewsListLocalDataProviderProtocol, NewsModel> {
    
    func getNewList() {
        NewsListRepository.shared.getNewList { newModelList, error in
            if let error = error {
                self.delegate?.errorData(self.delegate, error:error)
                return
            }
            if let model = newModelList {
                self.delegate?.success(model: model)
            }
        }
    }
    
}
