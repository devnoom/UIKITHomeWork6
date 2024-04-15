//
//  onboardingController.swift
//  UIKITHomeWork6
//
//  Created by MacBook Air on 14.04.24.
//

import UIKit

class onboardingController: UIViewController {
    let imageView = UIImageView()
    let startButton: UIButton = {
        let startButton = UIButton()
        startButton.setTitle("დაწყება", for: .normal)
        startButton.layer.cornerRadius = 23
        startButton.backgroundColor = .blue
        
        
        
        return startButton
    }()
    let startDescription: UIStackView = {
        let startDescription = UIStackView()
        
        
       return startDescription
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        imageView.image = UIImage(named: "splash")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        view.addSubview(startButton)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startDescription)
        startDescription.translatesAutoresizingMaskIntoConstraints = false
        configureStackOfDescription()
        startDescription.axis = .vertical
        startDescription.distribution = .equalSpacing
        
        
        
       
        startButton.addTarget(self, action: #selector(toHubViewController), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -20),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -130),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            startButton.widthAnchor.constraint(equalToConstant: 150),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            
            startDescription.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250),
            startDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            startDescription.widthAnchor.constraint(equalToConstant: 290),
            startDescription.heightAnchor.constraint(equalToConstant: 180)
        ])
        
        
        
        
        
    }
    func configureStackOfDescription() {
        let first = UILabel()
        first.text = "შედი"
        first.font = UIFont(name: "FiraGO-SemiBold", size: 30)
        first.textColor = .white
        let second = UILabel()
        second.text = "აპლიკაციაში"
        second.font = UIFont(name: "FiraGO-SemiBold", size: 30)
        second.textColor = .white
        let third = UILabel()
        third.text = "და იწუწუნე"
        third.font = UIFont(name: "FiraGO-SemiBold", size: 30)
        third.textColor = .white
        let fourth = UILabel()
        fourth.text = "რამდენიც გინდა"
        fourth.font = UIFont(name: "FiraGO-SemiBold", size: 30)
        fourth.textColor = .white
        
        startDescription.addArrangedSubview(first)
        startDescription.addArrangedSubview(second)
        startDescription.addArrangedSubview(third)
        startDescription.addArrangedSubview(fourth)
    }
    @objc func toHubViewController() {
        let hubViewController = HubViewController()
        hubViewController.modalPresentationStyle = .fullScreen
        self.present(hubViewController, animated: true, completion: nil)
    }

}
