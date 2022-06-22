//
//  PhotosDetailViewController.swift
//  StrAIberryHomeTask
//
//  Created by Ali Asadi on 3/28/1401 AP.
//

import UIKit

class PhotosDetailViewController: UIViewController {

    @IBOutlet weak var imageTitle: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    var photoDetailObject:Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageTitle.text = photoDetailObject?.title
        photo.loadImageByUrl(urlString: Domain().generateImageFromObject(photoObject: photoDetailObject ?? Photo()))
    }
    


}
