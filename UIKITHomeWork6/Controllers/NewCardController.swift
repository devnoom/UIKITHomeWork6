//
//  NewCardController.swift
//  UIKITHomeWork6
//
//  Created by MacBook Air on 14.04.24.
//

import UIKit

class NewCardController: UIViewController {
    let imageView = UIImageView()
    let choice: UILabel = {
        let choice = UILabel()
        choice.text = "აირჩიეთ აიქონი"
        return choice
    }()
    let addCard: UIButton = {
        let addCard = UIButton()
        addCard.setTitle("დამატება", for: .normal)
        addCard.layer.cornerRadius = 23
        addCard.backgroundColor = .green
        return addCard
    }()
    let cardInfo: UIStackView = {
        let cardInfo = UIStackView()
        cardInfo.backgroundColor = .red
        
        return cardInfo
    }()
    let cardICons: UIStackView = {
        let cardIcons = UIStackView()
        cardIcons.backgroundColor = .blue
        
        return cardIcons
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .cyan
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    
    func setupUI(){
        imageView.image = UIImage(named: "backGround")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        view.addSubview(addCard)
        addCard.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardInfo)
        cardInfo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardICons)
        cardICons.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(choice)
        choice.translatesAutoresizingMaskIntoConstraints = false
        
        configureCardInfo()
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            addCard.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -130),
            addCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            addCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            addCard.heightAnchor.constraint(equalToConstant: 50),
            
            cardInfo.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            cardInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cardInfo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cardInfo.heightAnchor.constraint(equalToConstant: 150),
            
            choice.topAnchor.constraint(equalTo: cardInfo.bottomAnchor, constant: 50),
            choice.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            cardICons.topAnchor.constraint(equalTo: choice.bottomAnchor, constant: 20),
            cardICons.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cardICons.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cardICons.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    func configureCardInfo() {
        let tittle = UILabel()
        tittle.text = "სათაური"
        let tittleText = UITextField()
        tittleText.borderStyle = .bezel
        let description = UILabel()
        description.text = "აღწერა"
        let descriptionText = UITextField()
        descriptionText.borderStyle = .bezel
        
        cardInfo.axis = .vertical
        cardInfo.distribution = .equalSpacing
        
        
        cardInfo.addArrangedSubview(tittle)
        cardInfo.addArrangedSubview(tittleText)
        cardInfo.addArrangedSubview(description)
        cardInfo.addArrangedSubview(descriptionText)
    }
    func configureCardIcons() {
        struct IconInfo {
            let imageName: String
        }
        let icons: [IconInfo] = [
            IconInfo(imageName: "redIcon"),
            IconInfo(imageName: "yellowIcon"),
            // Add more image names as needed
        ]
        
        let first = UIImage(named: "redIcon")
        cardICons.axis = .horizontal
        cardICons.distribution = .equalSpacing
        
        for iconInfo in icons {
            if let image = UIImage(named: iconInfo.imageName) {
                let imageView = UIImageView(image: image)
                cardICons.addArrangedSubview(imageView)
            }
        }
    }
}
#Preview {
    NewCardController()
}
