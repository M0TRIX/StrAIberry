//
//  PhotosCollectionViewCell.swift
//  StrAIberryHomeTask
//
//  Created by Ali Asadi on 3/25/1401 AP.
//

import UIKit

class PhotosCollectionViewCell:UICollectionViewCell, BaseCollectionViewCell{
    
    @IBOutlet weak var avatar:UIImageView!
    
    func bind(object: Any) {
        if let content = object as? Photo {
            self.avatar.loadImageByUrl(urlString: Domain().generateImageFromObject(photoObject: content))
        }
    }
    

}
