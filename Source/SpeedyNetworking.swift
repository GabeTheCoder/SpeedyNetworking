//
//  SpeedyNetworking.swift
//  Networking
//
//  Created by Gabe The Coder on 10/4/17.
//  Copyright © 2017 Gabe The Coder. All rights reserved.
//

import UIKit

class SpeedyNetworking {
    
    // MARK: Configuration
    
    class func setServerUrl(url: URL?) {
        SpeedyConfiguration.shared.defaultUrl = url
    }
    
    class func setAuthHeader(authorization: String) {
        SpeedyConfiguration.shared.defaultAuthorizationHeader = authorization
    }
    
}

extension SpeedyNetworking {
    
    // MARK: HTTP GET
    
    class func get(route: String, completion: @escaping (SpeedyResponse) -> Void) {
        SpeedyRequest(route: route)?.execute(completion: completion)
    }
    
    class func getUrl(url: URL?, completion: @escaping (SpeedyResponse) -> Void) {
        SpeedyRequest(url: url)?.execute(completion: completion)
    }
    
}

extension SpeedyNetworking {
    
    // MARK: HTTP POST
    
    class func post<T: Encodable>(route: String, model: T, completion: @escaping (SpeedyResponse) -> Void) {
        let params = SpeedyParams(model: model)
        SpeedyRequest(route: route, method: .post, params: params)?.execute(completion: completion)
    }
    
    class func postData(route: String, data: Any, completion: @escaping (SpeedyResponse) -> Void) {
        let params = SpeedyParams(params: data)
        SpeedyRequest(route: route, method: .post, params: params)?.execute(completion: completion)
    }
    
    class func postUrl<T: Encodable>(url: URL?, model: T, completion: @escaping (SpeedyResponse) -> Void) {
        let params = SpeedyParams(model: model)
        SpeedyRequest(url: url, method: .post, params: params)?.execute(completion: completion)
    }
    
    class func postUrlData(url: URL?, data: Any, completion: @escaping (SpeedyResponse) -> Void) {
        let params = SpeedyParams(params: data)
        SpeedyRequest(url: url, method: .post, params: params)?.execute(completion: completion)
    }
    
}

extension SpeedyNetworking {
    
    // MARK: HTTP PUT
    
    class func put<T: Encodable>(route: String, model: T, completion: @escaping (SpeedyResponse) -> Void) {
        let params = SpeedyParams(model: model)
        SpeedyRequest(route: route, method: .put, params: params)?.execute(completion: completion)
    }
    
    class func putData(route: String, data: Any, completion: @escaping (SpeedyResponse) -> Void) {
        let params = SpeedyParams(params: data)
        SpeedyRequest(route: route, method: .put, params: params)?.execute(completion: completion)
    }
    
    class func putUrl<T: Encodable>(url: URL?, model: T, completion: @escaping (SpeedyResponse) -> Void) {
        let params = SpeedyParams(model: model)
        SpeedyRequest(url: url, method: .put, params: params)?.execute(completion: completion)
    }
    
    class func putUrlData(url: URL?, data: Any, completion: @escaping (SpeedyResponse) -> Void) {
        let params = SpeedyParams(params: data)
        SpeedyRequest(url: url, method: .put, params: params)?.execute(completion: completion)
    }
    
}

extension SpeedyNetworking {
    
    // MARK: HTTP DELETE
    
    class func delete(route: String, completion: @escaping (SpeedyResponse) -> Void) {
        SpeedyRequest(route: route, method: .delete)?.execute(completion: completion)
    }
    
    class func deleteURL(url: URL?, completion: @escaping (SpeedyResponse) -> Void) {
        SpeedyRequest(url: url, method: .delete)?.execute(completion: completion)
    }
    
}

extension SpeedyNetworking {
    
    // MARK: Downloaders
    
    class func downloadImage(string: String, completion: @escaping (UIImage?) -> Void) {
        SpeedyDownload(string: string)?.executeImage(completion: completion)
    }
    
    class func downloadImage(url: URL?, completion: @escaping (UIImage?) -> Void) {
        SpeedyDownload(url: url)?.executeImage(completion: completion)
    }
    
}
