//
//  UIVIewController+Ext.swift
//  GitHubUsers
//
//  Created by batraz jioty on 09.11.2020.
//  Copyright © 2020 batraz jioty. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String, buttonText: String = "OK") {
        DispatchQueue.main.async {
            let alertVC = AlertVC(title: title, message: message, buttonTitle: buttonText)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            
            self.present(alertVC, animated: true)
        }
    }
}
