//
//  ImageCache.swift
//  fakestagram
//
//  Created by Luis Mauricio Esparza Vazquez on 4/26/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation
import UIKit

class ImageCache {
    let filename: String
    private let cache = NSCache<NSString, UIImage>()
    let dataContainer = DataContainer.cache //Inicializamos un contenedor de datos que será temporal (caché)
    
    init(filename: String) {
        self.filename = filename
    }
    
    func load() -> UIImage? { //Cargamos una imagen que posiblemente no exista (autor elimina)
        if let img = cache.object(forKey: filename as NSString){
            return img
        }
        guard let data = dataContainer.load(filename: filename) else {
            return nil
        }
        return UIImage(data: data)
    }
    
    func save(image: UIImage) -> Bool {
        cache.setObject(image, forKey: filename as NSString)
        
        guard let data = image.jpegData(compressionQuality: 0.95) else {
            print("Unable to load .jpeg data representation")
            return false
        }
        
        return dataContainer.save(data: data, in: filename)
    }
}
