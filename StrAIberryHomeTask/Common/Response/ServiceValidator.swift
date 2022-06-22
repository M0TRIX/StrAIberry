//
//  ServiceValidator.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/3/1401 AP.
//

import Foundation

class ServiceValidator{
    
    static func checkResposnse(response:URLResponse,value:Photos?)->ServiceError{
        
        guard let _ = value?.photo else{
            return ServiceError.INVALIDRESPONSE
        }
        let response = response as? HTTPURLResponse
        
        switch  response?.statusCode {
        case 200:
            return ServiceError.SUCCESS
        case 400:
            return ServiceError.BADREQUEST
        case 401:
            return ServiceError.UNAUTHORIZE
        case 402,403:
            return ServiceError.FORBIDDEN
        default:
            return ServiceError.SERVERERROR
        }
        
    }
}
