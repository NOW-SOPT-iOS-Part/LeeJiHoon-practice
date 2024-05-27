//
//  Config.swift
//  Semina
//
//  Created by 이지훈 on 4/27/24.
//

import Foundation

enum Config {
    
    enum Keys {
        enum Plist {
            static let baseURL = "BASE_URL"
        }
    }
    
    private static let infoDictionary: [String: Any]? = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist cannot")
        }
        return dict
    }()
    
}

extension Config {
    static let baseURL: String = {
        guard let key = Config.infoDictionary?[Keys.Plist.baseURL] as? String else {
            fatalError("Base URL not set in plist for this environment")
        }
        return key
    }()
}
