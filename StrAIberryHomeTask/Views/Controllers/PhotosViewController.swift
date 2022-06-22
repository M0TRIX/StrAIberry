//
//  ViewController.swift
//  StrAIberryHomeTask
//
//  Created by Ali Asadi on 3/24/1401 AP.
//

import UIKit

class PhotosViewController: UIViewController {

    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    var viewModel : PhotosViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = PhotosViewModel(serviceApi: ServiceApi(), controller: self)
        getPhotos()
    }

    func getPhotos(){
        viewModel?.getPhotosList(completion: { [weak self] response in
            DispatchQueue.main.async {
                self?.photoCollectionView.reloadData()
            }
        })
    }
}

extension PhotosViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.photoList?.photo?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "getPhotosIdentifier", for: indexPath) as! PhotosCollectionViewCell
        cell.bind(object: viewModel?.photoList?.photo?[indexPath.row] ?? "")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let value = viewModel?.photoList?.photo?[indexPath.row] {
            self.createInstance(photoObject: value)
        }
    }
}

extension PhotosViewController:UINavigationControllerDelegate {

    func createInstance(photoObject:Photo){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "PhotosDetailViewController") as! PhotosDetailViewController
        newViewController.modalTransitionStyle = .flipHorizontal
        newViewController.photoDetailObject = photoObject
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}
