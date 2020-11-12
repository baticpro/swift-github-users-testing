//
//  BatrazLabel.swift
//  GitHubUsers
//
//  Created by batraz jioty on 09.11.2020.
//  Copyright © 2020 batraz jioty. All rights reserved.
//

import UIKit

class BatrazLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlign: NSTextAlignment, fontSize: CGFloat) {
        super.init(frame: .zero)
        self.textAlignment = textAlign
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        
        configure()
    }
    
    private func configure() {
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
