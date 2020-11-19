//
//  UIVIewController+Ext.swift
//  GitHubUsers
//
//  Created by batraz jioty on 09.11.2020.
//  Copyright © 2020 batraz jioty. All rights reserved.
//

import UIKit

fileprivate var containerView: UIView!

extension UIViewController {
    func showAlert(title: String, message: String, buttonText: String = "OK") {
        DispatchQueue.main.async {
            let alertVC = AlertVC(title: title, message: message, buttonTitle: buttonText)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            
            self.present(alertVC, animated: true)
        }
    }
    
    func showActivityIndicator() {
        containerView = UIView(frame: view.bounds)
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        view.addSubview(containerView)
        
        UIView.animate(withDuration: 0.3) {
            containerView.alpha = 0.85
        }
        
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(indicator)
        

        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        
        indicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
    }
    
    func showEmptyMessageView(with message: String, view: UIView) {
        let emptyMessageView = BatrazEmptyView(message: message)
        view.addSubview(emptyMessageView)
        emptyMessageView.frame = view.bounds 
    }
}
