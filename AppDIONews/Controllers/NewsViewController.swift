//
//  NewsViewController.swift
//  AppDIONews
//
//  Created by Eduardo Alexandre on 27/01/23.
//

import WebKit

class NewsViewController: UIViewController {
    
    @IBOutlet weak var newsWebView: WKWebView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var loadingActivityIndicator: UIActivityIndicatorView!
    
    var news: NewsModel? {
        didSet {
            self.title = news?.source.name
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupWebView()
    }
    
    private func setupWebView() {
        //A propria classe está delegando a extensão para animação do carregamento de tela
        self.newsWebView.navigationDelegate = self
        
        guard let news = news, let url = URL(string: news.url) else { return }
        self.newsWebView.load(URLRequest(url: url))
        self.newsWebView.allowsBackForwardNavigationGestures = true
    }
}

extension NewsViewController: WKNavigationDelegate {
    
    // Inicia a animação de carregamento de tela
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.loadingActivityIndicator.startAnimating()
        self.loadingView.isHidden = false
    }
    
    // Para e esconde a animação após o carregamento da tela
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.loadingView.isHidden = true
        self.loadingActivityIndicator.stopAnimating()
    }
    
    // Caso de falha
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.loadingView.isHidden = true
        self.loadingActivityIndicator.stopAnimating()
    }
}
