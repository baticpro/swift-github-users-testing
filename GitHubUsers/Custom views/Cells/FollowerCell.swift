//
//  FollowerCell.swift
//  GitHubUsers
//
//  Created by batraz jioty on 11.11.2020.
//  Copyright © 2020 batraz jioty. All rights reserved.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    static let reuseId = "FollowerCell"
    
    let avatarImageVeiw = AvatarImageView(frame: .zero)
    let usernameLabel = BatrazLabel(textAlign: .left, fontSize: 23)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        confiture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(follower: Follower) {
        usernameLabel.text = follower.login
        avatarImageVeiw.downloadImage(from: follower.avatarUrl)
    }
    
    private func confiture() {
        addSubview(avatarImageVeiw)
        addSubview(usernameLabel)
        
        let padding: CGFloat = 10
        
        NSLayoutConstraint.activate([
            avatarImageVeiw.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImageVeiw.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImageVeiw.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarImageVeiw.heightAnchor.constraint(equalTo: avatarImageVeiw.widthAnchor),
            
            usernameLabel.topAnchor.constraint(equalTo: avatarImageVeiw.bottomAnchor, constant: 12),
            usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}
