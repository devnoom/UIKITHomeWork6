//
//  NewCardController.swift
//  UIKITHomeWork6
//
//  Created by MacBook Air on 14.04.24.
//

import UIKit

class NewCardController: UIViewController {
    
    let imageView = UIImageView()
    let tittleText = UITextField()
    let descriptionText = UITextField()
    let choice: UILabel = {
        let choice = UILabel()
        choice.text = "აირჩიეთ აიქონი"
        choice.textColor = .white
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
        //cardInfo.backgroundColor = .red
        
        return cardInfo
    }()
    let cardICons: UIStackView = {
        let cardIcons = UIStackView()
        //cardIcons.backgroundColor = .blue
        
        return cardIcons
    }()
    
    var hubView: HubViewController?
    var cellview: HubCardViewCell?
    
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
        configureCardIcons()
        
        addCard.addTarget(self, action: #selector(toAddNewCardController), for: .touchUpInside)
        
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
            cardInfo.heightAnchor.constraint(equalToConstant: 190),
            
            choice.topAnchor.constraint(equalTo: cardInfo.bottomAnchor, constant: 50),
            choice.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            cardICons.topAnchor.constraint(equalTo: choice.bottomAnchor, constant: 20),
            cardICons.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            cardICons.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            cardICons.heightAnchor.constraint(equalToConstant: 50),
            
            tittleText.heightAnchor.constraint(equalToConstant: 50),
            descriptionText.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    func configureCardInfo() {
        let cardTittle = UILabel()
        cardTittle.text = "სათაური"
        cardTittle.textColor = .white
        
        tittleText.borderStyle = .bezel
        tittleText.placeholder = "მაგ: პანიკა, დახმარება მჭირდება"
        tittleText.layer.cornerRadius = tittleText.frame.height / 2
        
        let description = UILabel()
        description.text = "აღწერა"
        description.textColor = .white
        
        descriptionText.borderStyle = .bezel
        descriptionText.placeholder = "მაგ: ფიგმამ გამიჭედა და ვინმემ გამომიგზავნეთ"
        descriptionText.layer.cornerRadius = 25
        
        cardInfo.axis = .vertical
        cardInfo.distribution = .equalSpacing
        
        
        cardInfo.addArrangedSubview(cardTittle)
        cardInfo.addArrangedSubview(tittleText)
        cardInfo.addArrangedSubview(description)
        cardInfo.addArrangedSubview(descriptionText)
    }
    func configureCardIcons() {
        cardICons.axis = .horizontal
        cardICons.distribution = .fillEqually
        cardICons.spacing = 35
        
        let greenIcon = UIImageView()
        greenIcon.image = UIImage(named: "greenIcon")
        let yellowIcon = UIImageView()
        yellowIcon.image = UIImage(named: "yellowIcon")
        let redIcon = UIImageView()
        redIcon.image = UIImage(named: "redIcon")
        let purpleIcon = UIImageView()
        purpleIcon.image = UIImage(named: "purpleIcon")
        
        cardICons.addArrangedSubview(redIcon)
        cardICons.addArrangedSubview(purpleIcon)
        cardICons.addArrangedSubview(greenIcon)
        cardICons.addArrangedSubview(yellowIcon)
      
        
        
    }
    @objc func toAddNewCardController() {
        let newTitle = tittleText.text ?? ""
        let newDescription = descriptionText.text ?? ""
        // You might want to pass the icon as well if needed
        hubView?.addNewCard(Cards(tittle: newTitle, description: newDescription, icon: icons.redIcon!))
        dismiss(animated: true, completion: nil)
    }


}
#Preview {
    NewCardController()
}
