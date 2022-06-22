//
//  Domain.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/6/1401 AP.
//

import Foundation


class Domain{

//https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=11af5281b84d459995d712b137383715&format=json&nojsoncallback=1&auth_token=72157720847946217-d6911667b8345f42&api_sig=938558cefea9010dd83ae1e34694a56d
    
    var address = "https://www.flickr.com/"
    var subAddress = "services/rest/?method=flickr.photos.search"
    var api_key = "11af5281b84d459995d712b137383715"
    var auth_token = "72157720847946217-d6911667b8345f42"
    var api_sig = "938558cefea9010dd83ae1e34694a56d"
    
    var PhotoAddress = "https://live.staticflickr.com/"

    func getBaseDomain()->String{
        return address
    }
    
    func getsubDomain()->String{
        return subAddress
    }
     
    func getDomain()->String{
        return address + subAddress
    }
    
     func getFullUrl()->String{
        return address + subAddress + "&api_key=" + api_key + "&format=json&nojsoncallback=1&auth_token=" + auth_token + "&api_sig=" + api_sig
    }
 
    func generateImageFromObject(photoObject:Photo)->String{
        return PhotoAddress + "\(photoObject.server ?? "")" + "/" + "\(photoObject.id ?? "")" + "_" + "\(photoObject.secret ?? "")" + "_w.jpg"
    }
}
