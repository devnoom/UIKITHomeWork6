//
//  HubViewController.swift
//  UIKITHomeWork6
//
//  Created by MacBook Air on 14.04.24.
//

import UIKit

class HubViewController: UIViewController {
    let imageView = UIImageView()
    
//    let cardsCollView: UICollectionView = {
//        let cardsCollView = UICollectionView()
//        
//    return cardsCollView
//    }()
    let addCardButton: UIButton = {
        let addCardButton = UIButton()
        addCardButton.setTitle("ახალი წუწუნ ბარათის დამატება", for: .normal)
        addCardButton.layer.cornerRadius = 23
        addCardButton.backgroundColor = .blue
    return addCardButton
    }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
            
        }
        
    func setupUI(){
        imageView.image = UIImage(named: "backGround")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        view.addSubview(addCardButton)
        addCardButton.translatesAutoresizingMaskIntoConstraints = false
        //view.addSubview(cardsCollView)
        
        addCardButton.addTarget(self, action: #selector(toAddNewCardController), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            addCardButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -130),
            addCardButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            addCardButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addCardButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    @objc func toAddNewCardController() {
        let toAddNewCardController = NewCardController()
        toAddNewCardController.modalPresentationStyle = .fullScreen
        self.present(toAddNewCardController, animated: true, completion: nil)
    }
    }

