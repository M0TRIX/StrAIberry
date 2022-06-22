//
//  Landing.swift
//  StrAIberryHomeTask
//
//  Created by Ali Asadi on 3/25/1401 AP.
//

import Foundation

struct Landing: Decodable {
    let photos: Photos?
    let stat: String
    
    enum CodingKeys: String, CodingKey {
        case photos
        case stat
    }
}
