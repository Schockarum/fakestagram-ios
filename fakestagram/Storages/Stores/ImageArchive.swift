//
//  ImageStore.swift
//  fakestagram
//
//  Created by Luis Mauricio Esparza Vazquez on 4/26/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation
import UIKit

struct ImageArchive {
    let filename: String
    let dataContainer = DataContainer.permanent //Inicializamos un contenedor de datos que será permanente
    
    func load() -> UIImage? { //Cargamos una imagen que posiblemente no exista (autor elimina)
        guard let data = dataContainer.load(filename: filename) else {
            return nil
        }
        return UIImage(data: data)
    }
    
    func save(image: UIImage) -> Bool {
        guard let data = image.jpegData(compressionQuality: 0.95) else {
            print("Unable to load .jpeg data representation")
            return false
        }
        return dataContainer.save(data: data, in: filename)
    }
}
