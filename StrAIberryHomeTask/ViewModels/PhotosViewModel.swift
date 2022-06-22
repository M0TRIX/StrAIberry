//
//  PhotosViewModel.swift
//  StrAIberryHomeTask
//
//  Created by Ali Asadi on 3/25/1401 AP.
//

import Foundation
import UIKit
import Alamofire

class PhotosViewModel: PhotosProtocols{
    
    var serviceApi:ServiceApi?
    var controller:UIViewController?
    var photoList: Photos?
    
    init(serviceApi:ServiceApi,controller:UIViewController) {
        self.serviceApi = serviceApi
        self.controller = controller
    }
    
    func getPhotosList(completion: @escaping ([Photo]) -> ()){
        let url = Domain().getFullUrl()
        serviceApi?.getListOfPhotos(url: url, requestType: .get, header: nil, param: nil, completion: { [weak self] photos,response,data  in
            
            let responseResult = ServiceValidator.checkResposnse(response: response, value: photos)
            
            if responseResult == ServiceError.SUCCESS{
                self?.photoList = photos
                completion(photos.photo!)
            }else{
                
                MessageUtill.makeMessage(title: "connection failed", body: "\(responseResult)", controller: self?.controller ?? UIViewController()) { [weak self] in
                    self?.getPhotosList { _ in}
                }
            }
        })
    }
}
