//
//  ViewController.swift
//  KriptoParaUygulamasi
//
//  Created by Atil Samancioglu on 21.10.2023.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController{
    

    
    var cryptoList = [Crypto]()
    let disposeBag = DisposeBag()
    
    let cryptoVM = CryptoViewModel()
    
    var cryptosTable : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .white
        return table
    }()
    
    var activityIndicator : UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.layer.zPosition = 2
        activity.hidesWhenStopped = true
        return activity
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addComponents()
        setupBindings()
        configureCryptosTable()
        cryptoVM.requestData()
       
    }
    
    override func viewDidLayoutSubviews() {
        setLayouts()
    }
    
    
}

