//
//  ServiceApi.swift
//  StrAIberryHomeTask
//
//  Created by Ali Asadi on 3/25/1401 AP.
//

import Foundation
import Alamofire

class ServiceApi {

    func getListOfPhotos(url:String,requestType:HTTPMethod,header:HTTPHeaders?,param:Parameters?,completion: @escaping(Photos, URLResponse,Data)->()){
        
        let request = AF.request(url, method: requestType, parameters: param, encoding: JSONEncoding.default, headers: header, interceptor: nil)
        
        request.responseDecodable(of: Landing.self) {(resposnse) in
        completion(resposnse.value?.photos ?? Photos(), resposnse.response!, resposnse.data!)
        }
    
    }
    
}
