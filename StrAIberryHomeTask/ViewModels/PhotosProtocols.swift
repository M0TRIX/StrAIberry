//
//  PhotosProtocols.swift
//  StrAIberryHomeTask
//
//  Created by Ali Asadi on 3/28/1401 AP.
//

import Foundation
import UIKit

protocol PhotosProtocols {
    var serviceApi:ServiceApi? { get set }
    var controller:UIViewController? { get set }
    var photoList: Photos? { get set }
    func getPhotosList(completion: @escaping ([Photo]) -> ())
}
