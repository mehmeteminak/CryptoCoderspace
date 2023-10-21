//
//  ViewController.extension.swift
//  KriptoParaUygulamasi
//
//  Created by Macbook Air on 21.10.2023.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

extension ViewController : UITableViewDelegate, UITableViewDataSource  {
    
    func configureCryptosTable(){
        cryptosTable.delegate = self
        cryptosTable.dataSource = self
        cryptosTable.register(CryptoCell.self, forCellReuseIdentifier: "cryptoCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dump(cryptoList.count)
        return cryptoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let crypto = cryptoList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cryptoCell", for: indexPath) as! CryptoCell
        cell.configureCell(with: crypto)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension ViewController {
    func setupBindings() {
        
        cryptoVM
            .cryptos
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { cryptos in
            self.cryptoList = cryptos
                
                dump(self.cryptoList)
            self.cryptosTable.reloadData()
            }.disposed(by: disposeBag)
        
        
        cryptoVM
            .error
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { error in
                print(error)
            }.disposed(by: disposeBag)
        
   
        cryptoVM
            .loading
            .bind(to: self.activityIndicator.rx.isAnimating)
            .disposed(by: disposeBag)
        
        
        cryptoVM
            .loading
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { bool in
                print(bool)
            }.disposed(by: disposeBag)
        
    }
}

extension ViewController {
    func setLayouts(){
        NSLayoutConstraint.activate([
            cryptosTable.topAnchor.constraint(equalTo: view.topAnchor),
            cryptosTable.leftAnchor.constraint(equalTo: view.leftAnchor),
            cryptosTable.rightAnchor.constraint(equalTo: view.rightAnchor),
            cryptosTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    
    func addComponents(){
        view.addSubview(cryptosTable)
        view.addSubview(activityIndicator)
    }
}
