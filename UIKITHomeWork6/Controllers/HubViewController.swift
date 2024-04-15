//
//  HubViewController.swift
//  UIKITHomeWork6
//
//  Created by MacBook Air on 14.04.24.
//

import UIKit

class HubViewController: UIViewController {
    let imageView = UIImageView()

    let addCardButton: UIButton = {
        let addCardButton = UIButton()
        addCardButton.setTitle("ახალი წუწუნ ბარათის დამატება", for: .normal)
        addCardButton.layer.cornerRadius = 23
        addCardButton.backgroundColor = .blue
        
    return addCardButton
    }()
    var collectioView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionViewFlowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collectionViewFlowLayout.minimumInteritemSpacing = 25
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: collectionViewFlowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
        
    var cards: [Cards] = []
    var newCard: NewCardController?
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            setupUI()
            
            setupDummyData()
            
            
        }
    func setupDummyData() {
           
           cards = [
            Cards(tittle: "beka ras gverchi", description: "ახლა გავხსენი დავალება ეს რაარი", icon: UIImage(named: "redIcon")!),
            Cards(tittle: "რამე სიმღერა მირჩიეთ", description: "დავალების კეთებისას სიმღერები ქაია", icon: UIImage(named: "purpleIcon")!),
            Cards(tittle: "ფიგმამ თქვენც დაგტანჯათ?", description: "შევწუხდი ამ დაბალი ხარისხით", icon: UIImage(named: "greenIcon")!),
            Cards(tittle: "ბექ ბექ ბექ", description: "სამიი ლუჩიი ძეეენ ზახადილ ვჩერაა", icon: UIImage(named: "yellowIcon")!)
           ]
           
           
        collectioView.reloadData()
       }
        
    func setupUI(){
        imageView.image = UIImage(named: "backGround")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        view.addSubview(addCardButton)
        setupCollectionView()
        addCardButton.translatesAutoresizingMaskIntoConstraints = false
        
        
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
    func setupCollectionView() {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionViewFlowLayout.minimumLineSpacing = 20
        collectionViewFlowLayout.itemSize = CGSize(width: 150, height: 200)
        
        collectioView.collectionViewLayout = collectionViewFlowLayout
        
        collectioView.dataSource = self
        collectioView.delegate = self
        
        view.addSubview(collectioView)
        collectioView.translatesAutoresizingMaskIntoConstraints = false
        collectioView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        collectioView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        collectioView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        collectioView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -220).isActive = true
        collectioView.backgroundColor = .clear
        
        collectioView.register(HubCardViewCell.self, forCellWithReuseIdentifier: "HubCardViewCell")
    }



    @objc func toAddNewCardController() {
        let toAddNewCardController = NewCardController()
        toAddNewCardController.hubView = self
        toAddNewCardController.modalPresentationStyle = .fullScreen
        self.present(toAddNewCardController, animated: true, completion: nil)
    }
    }

extension HubViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let hubCardViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HubCardViewCell", for: indexPath) as! HubCardViewCell
        
        let currentCard = cards[indexPath.row]
        
        hubCardViewCell.titleLabel.text = currentCard.tittle
        hubCardViewCell.descriptionLabel.text = currentCard.description
        hubCardViewCell.iconImageView.image = currentCard.icon
        hubCardViewCell.addCardAction = { [weak self] in
            guard let self = self else { return }
            self.addNewCard(Cards(tittle: self.newCard?.tittleText.text ?? "", description: self.newCard?.descriptionText.text ?? "", icon: icons.redIcon!))
            print("New card added")
        }
        
        return hubCardViewCell
    }

}
extension HubViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selected = cards[indexPath.row]
        print("navigate to \(selected) details")
    }
}
extension HubViewController {
    func addNewCard(_ newCard: Cards) {
        cards.append(newCard)
        collectioView.reloadData()
    }

}

