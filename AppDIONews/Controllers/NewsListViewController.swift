//
//  NewsListViewController.swift
//  AppDIONews
//
//  Created by Eduardo Alexandre on 26/01/23.
//

import UIKit

class NewsListViewController: UIViewController {

    @IBOutlet weak var newsListTableView: UITableView!
    
    private var newsList: [NewsModel]? {
        didSet {
            self.newsListTableView.reloadData()
        }
    }
    
    var localDataProvider: NewsListLocalDataProvider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableView()
        self.initLocalDataProvider()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowNewsViewController", let destination =
            segue.destination as? NewsViewController {
            destination.news = sender as? NewsModel
        }
    }

    private func setupTableView() {
        self.newsListTableView.delegate = self
        self.newsListTableView.dataSource = self
        // Chama a newsListTableView
        self.newsListTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
    }
    
    private func initLocalDataProvider() {
        self.localDataProvider = NewsListLocalDataProvider()
        self.localDataProvider?.delegate = self
        self.localDataProvider?.getNewList()
    }
}


extension NewsListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let newsList = newsList else {
            fatalError("The selected news was not found!")
        }
        performSegue(withIdentifier: "ShowNewsViewController", sender: newsList[indexPath.row])
    }
}

extension NewsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell else {
            fatalError("Unable to dequeue subclassed cell")
        }
        
        guard let newsList = newsList else {
            fatalError("Does not have a news list")
        }
        
        cell.news = newsList[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
}

extension NewsListViewController: NewsListLocalDataProviderProtocol {
    func success(model: Any) {
        self.newsList = model as? [NewsModel]
    }
    
    func errorData(_ provide: GenericDataProvider?, error: Error) {
        print("Error: \(error.localizedDescription)")
    }
}
