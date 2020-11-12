//
//  BatrazButton.swift
//  GitHubUsers
//
//  Created by batraz jioty on 07.11.2020.
//  Copyright © 2020 batraz jioty. All rights reserved.
//

import UIKit

class BatrazButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        confgure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(bgColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = bgColor
        self.setTitle(title, for: .normal)
        confgure()
    }
    
    private func confgure() {
        layer.cornerRadius = 12
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
