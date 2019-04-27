//
//  DataStore.swift
//  fakestagram
//
//  Created by Luis Mauricio Esparza Vazquez on 4/26/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation

enum DataContainer {
    case cache
    case permanent
    
    var baseUrl: URL {
        switch self {
        case .cache:
            return StorageType.cache.url
        case .permanent:
            return StorageType.permanent.url
        }
    }
    
    func fileUrl(for filename: String) -> URL? {
        var fileUrl = baseUrl
        fileUrl.appendPathComponent(filename)
        return fileUrl
    }
    
    func load(filename: String) -> Data? { //Cargamos una imagen que posiblemente no exista (autor elimina)
        guard let url = fileUrl else {
            return nil
        }
        return try? Data(contentsOf: data)
    }
    
    func save(data: Data) -> Bool {
        
    }


}
