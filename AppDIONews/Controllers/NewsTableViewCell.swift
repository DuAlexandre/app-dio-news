//
//  NewsTableViewCell.swift
//  AppDIONews
//
//  Created by Eduardo Alexandre on 27/01/23.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var sourceNameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageImageView: UIImageView!
    @IBOutlet weak var publishedLabel: UILabel!
    @IBOutlet weak var linkImageView: UIImageView!
    
    // Setar as variáveis acima com os dados do banco/arquivo/api
    public var news: NewsModel? {
        //Após ser setada
        didSet {
            self.sourceNameLabel.text = news?.source.name
            self.authorLabel.text = news?.author
            self.titleLabel.text = news?.title
            self.descriptionLabel.text = news?.description
            self.imageImageView.loadImage()
            self.publishedLabel.text = news?.publishedAt.toString()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension UIImageView {
    func loadImage() {
        self.image = UIImage(named: "no-image.png")
    }
}

// Formata data para padrão PT-BR
extension Date {
    func toString(with formatter: String = "dd/MM/yyyy") -> String? {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = formatter
        return dateFormat.string(from: self)
    }
}
