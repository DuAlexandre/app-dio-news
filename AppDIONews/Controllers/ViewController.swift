//
//  ViewController.swift
//  AppDIONews
//
//  Created by Eduardo Alexandre on 26/01/23.
//

import UIKit

class ViewController: UIViewController, NewsListLocalDataProviderProtocol {

    var localDataProvider: NewsListLocalDataProvider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initLocalDataProvider()
    }

    private func initLocalDataProvider() {
        self.localDataProvider = NewsListLocalDataProvider()
        self.localDataProvider?.delegate = self
        self.localDataProvider?.getNewList()
    }

    func success(model: Any) {
        print("Model: \(model)")
    }
    
    func errorData(_ provide: GenericDataProvider?, error: Error) {
        print("Error: \(error.localizedDescription)")
    }
}

