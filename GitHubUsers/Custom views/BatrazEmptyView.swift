//
//  BatrazEmptyView.swift
//  GitHubUsers
//
//  Created by batraz jioty on 19.11.2020.
//  Copyright © 2020 batraz jioty. All rights reserved.
//

import UIKit

class BatrazEmptyView: UIView {
    let messageLabel = BatrazLabel(textAlign: .center, fontSize: 32)
    let emptyImageLogo = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(message: String) {
        super.init(frame: .zero)
        messageLabel.text = message
        configure()
    }
    
    func configure() {
        addSubview(emptyImageLogo)
        addSubview(messageLabel)

        
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .secondaryLabel
        
        emptyImageLogo.image = UIImage(named: "empty-state-logo")
        emptyImageLogo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -100),
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 35),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -35),
            messageLabel.heightAnchor.constraint(equalToConstant: 150),
            
            emptyImageLogo.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.2),
            emptyImageLogo.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.2),
            emptyImageLogo.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 120),
            emptyImageLogo.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 40)
        ])
    }
}
