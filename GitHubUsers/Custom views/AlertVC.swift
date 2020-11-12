//
//  AlertVC.swift
//  GitHubUsers
//
//  Created by batraz jioty on 09.11.2020.
//  Copyright © 2020 batraz jioty. All rights reserved.
//

import UIKit

class AlertVC: UIViewController {
    let containerView = UIView()
    let titleLabel = BatrazLabel(textAlign: .center, fontSize: 20)
    let bodyLabel = BatrazLabel(textAlign: .center, fontSize: 15)
    let button = BatrazButton(bgColor: .systemBlue, title: "OK")
    
    var alertTitle: String?
    var body: String?
    var buttonTitle: String?
    
    let padding: CGFloat = 20
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        
        self.alertTitle = title
        self.body = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.65)
        
        configureContainer()
        configureTitle()
        configureButton()
        configureBody()
    }
    
    func configureContainer() {
        view.addSubview(containerView)
        containerView.layer.cornerRadius = 20
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 250),
            containerView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureTitle() {
        containerView.addSubview(titleLabel)
        titleLabel.text = alertTitle ?? "default text"
    
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func configureButton() {
        containerView.addSubview(button)
        button.setTitle(buttonTitle ?? "default text", for: .normal)
        button.addTarget(self, action: #selector(closeAlert), for: .touchUpInside)
    
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            button.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            button.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            button.heightAnchor.constraint(equalToConstant: 45 )
        ])
    }
    
    func configureBody() {
        containerView.addSubview(bodyLabel)
        bodyLabel.text = body ?? "default text"
        bodyLabel.numberOfLines = 4
    
        NSLayoutConstraint.activate([
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: padding),
            bodyLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            bodyLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            bodyLabel.heightAnchor.constraint(equalToConstant: 45 )
        ])
    }
    
    @objc func closeAlert()
    {
        dismiss(animated: true)
    }
}
