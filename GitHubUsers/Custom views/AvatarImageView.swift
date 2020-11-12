//
//  AvatarImageView.swift
//  GitHubUsers
//
//  Created by batraz jioty on 11.11.2020.
//  Copyright © 2020 batraz jioty. All rights reserved.
//

import UIKit

class AvatarImageView: UIImageView {
    var placeholderImage = UIImage(named: "avatar-placeholder")

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 25
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        
        image = placeholderImage
        
    }
    
    func downloadImage(from url: String) {
        let key = NSString(string: url)
        
        if let image = NetworkManager.shared.cache.object(forKey: key) {
            self.image = image
            return
        }
        
        guard let url = URL(string: url) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else { return }
            if error != nil {return}
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            guard let image = UIImage(data: data) else { return }
            
            NetworkManager.shared.cache.setObject(image, forKey: key)
            print("set cached image")
            
            DispatchQueue.main.async {
                self.image = image
            }
        }
        
        task.resume()
    }
}
