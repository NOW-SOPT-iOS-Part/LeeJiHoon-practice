//
//  SignUpRequestModel.swift
//  Semina
//
//  Created by 이지훈 on 4/27/24.
//

import Foundation

struct SignUpRequestModel: Codable {
    let authenticationId: String
    let password: String
    let nickname: String
    let phone: String
}
