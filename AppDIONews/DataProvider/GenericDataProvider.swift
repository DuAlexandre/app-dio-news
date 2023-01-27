//
//  GenericDataProvider.swift
//  AppDIONews
//
//  Created by Eduardo Alexandre on 26/01/23.
//

import Foundation

protocol GenericDataProvider {
    func success(model: Any)
    func errorData(_ provide: GenericDataProvider?, error: Error)
}

class DataProviderManager<T, S> {
    var delegate: T?
    var model: S?
}
