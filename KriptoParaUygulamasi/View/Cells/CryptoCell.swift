//
//  CryptoCell.swift
//  KriptoParaUygulamasi
//
//  Created by Macbook Air on 21.10.2023.
//

import Foundation
import UIKit

class CryptoCell : UITableViewCell {
    
    var cryptoNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16,weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    var cryptoPriceLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16,weight: .medium)
        label.textAlignment = .right
        return label
    }()
    
    func configureCell(with crypto : Crypto) {
        cryptoNameLabel.attributedText = NSAttributedString(string: crypto.currency,attributes: [.foregroundColor : UIColor.black])
        cryptoPriceLabel.attributedText = NSAttributedString(string: crypto.price,attributes: [.foregroundColor : UIColor.black])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(cryptoNameLabel)
        contentView.addSubview(cryptoPriceLabel)
        layoutForCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutForCell(){
        NSLayoutConstraint.activate([
            cryptoNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: contentView.bounds.height / 2),
            cryptoNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 10),
            cryptoNameLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width / 2 - 20), // This is covering the half of the content view just 10 dp left and 10 dp right
            
            cryptoPriceLabel.topAnchor.constraint(equalTo: cryptoNameLabel.topAnchor),
            cryptoPriceLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: 10),
            cryptoPriceLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width / 2 - 20), // This is covering the half of the content view just 10 dp left and 10 dp right
        ])
    }
}
