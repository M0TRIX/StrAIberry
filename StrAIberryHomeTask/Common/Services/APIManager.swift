//
//  APIManager.swift
//  StrAIberryHomeTask
//
//  Created by Ali Asadi on 4/1/1401 AP.
//

import Foundation
import Alamofire

class APIManager {
    
    class func headers(authType:AuthenticationType,token:String) -> HTTPHeaders {
        var headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        if  authType == .Token {
            headers["Authorization"] = token
        }else{
            headers["Bearer"] = token
        }
        return headers
    }
}
