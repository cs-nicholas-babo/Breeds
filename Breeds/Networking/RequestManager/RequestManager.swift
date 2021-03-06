//
//  RequestManager.swift
//  Breeds
//
//  Created by erick.lozano.borges on 08/08/20.
//  Copyright © 2020 borges.erick. All rights reserved.
//

import Alamofire
import Foundation

protocol RequestManager {
    func request<T: Decodable>(url: URL, method: HTTPMethod, parameters: [String: Any], headers: [String: String], completion: @escaping(Result<T, Error>) -> Void)
}

enum RequestManagerFactory {
    case alamofire
    
    func create() -> RequestManager {
        switch self {
        case .alamofire:
            return AlamofireRequestManager()
        }
    }
}

enum HTTPMethod: String {
    case get
    case post
    
    var alamofire: Alamofire.HTTPMethod {
        switch self {
        case .get:
            return Alamofire.HTTPMethod.get
        case .post:
            return Alamofire.HTTPMethod.post
        }
    }
}
