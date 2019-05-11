//
//  CameraViewController.swift
//  fakestagram
//
//  Created by Luis Mauricio Esparza Vazquez on 4/27/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController {
    let client = CreatePostClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //cuando se hace el tap en "Create" se intenta cargar una imagen hard codeada (está en assets) y, si logra crearse, se genera un payload que se envia a la API para generar un post con su título y la imagen en formato base 64
    @IBAction func onTapCreate(_ sender: Any) {
        guard let img = UIImage(named: "gatoauto"),
              let imgBase64 = img.encondeBase64() else { return }
        let payload = CreatePostBase64(title: ">( ò n ó )< - \(Date().currentTimestamp())", imageData: imgBase64)
        client.create(payload: payload) { post in
            print(post)
        }
        print(img.encondeBase64()!)
    }
    
}
