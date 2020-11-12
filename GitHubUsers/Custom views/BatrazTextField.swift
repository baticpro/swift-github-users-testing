//
//  BatrazTextField.swift
//  GitHubUsers
//
//  Created by batraz jioty on 07.11.2020.
//  Copyright © 2020 batraz jioty. All rights reserved.
//

import UIKit

class BatrazTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        confgure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func confgure() {
        layer.cornerRadius = 12
        layer.borderWidth = 4
        layer.borderColor = UIColor.systemGray.cgColor
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        
        translatesAutoresizingMaskIntoConstraints = false
        returnKeyType = .go
        
        placeholder = "enter user name"
    }
}
