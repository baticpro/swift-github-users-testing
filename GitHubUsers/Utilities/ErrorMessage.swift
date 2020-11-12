//
//  ErrorMessage.swift
//  GitHubUsers
//
//  Created by batraz jioty on 10.11.2020.
//  Copyright © 2020 batraz jioty. All rights reserved.
//

import Foundation

enum ErrorMessage: String, Error {
    case invalidUrl = "wrong url"
    case invalidData = "wrong data"
    case invalidResponse = "wrong response"
    
    func custom(str: String) -> RawValue {
        return str
    }
}
