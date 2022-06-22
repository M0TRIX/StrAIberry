//
//  Photo.swift
//  StrAIberryHomeTask
//
//  Created by Ali Asadi on 3/25/1401 AP.
//

import Foundation

struct Photo: Decodable {
    var id, owner, secret, server: String?
    var farm: Int?
    var title: String?
    var ispublic, isfriend, isfamily: Int?
//    
//    enum CodingKeys: String, CodingKey {
//        case id, owner, secret, server
//        case farm
//        case title
//        case ispublic, isfriend, isfamily
//    }
    init() {
    }
}
