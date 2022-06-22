//
//  Photos.swift
//  StrAIberryHomeTask
//
//  Created by Ali Asadi on 3/25/1401 AP.
//

import Foundation
struct Photos: Decodable {
    var page , pages, perpage, total: Int?
    var photo: [Photo]?
 
    init() {}
}
