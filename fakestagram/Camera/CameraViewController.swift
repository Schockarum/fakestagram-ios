//
//  CameraViewController.swift
//  fakestagram
//
//  Created by Luis Mauricio Esparza Vazquez on 4/27/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit
import AVFoundation
import CoreLocation

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let locationManager = CLLocationManager()
    let client = CreatePostClient()
    var currentLocation: CLLocation?
    
    @IBOutlet weak var pickedImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enableBasicLocationServices()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        locationManager.startUpdatingLocation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        locationManager.startUpdatingLocation()
        super.viewWillDisappear(animated)
    }
    
    
    @IBAction func onTapCamera(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func onTapGallery(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func onTapPost(_ sender: Any) {
        //let img = UIImage(named: "PanzerCat")!
        if let img = pickedImage.image{
            print("posting....")
            createPost(img: img)
        } else {
            print("Aún no se selecciona imagen.")
        }
    }
    
    
    func enableBasicLocationServices() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            print("Disable location features")
        case .authorizedWhenInUse, .authorizedAlways:
            print("Enable location features")
        }
    }
    
    func createPost(img: UIImage) {
        guard let imgBase64 = img.encodedBase64() else { return }
        let timestamp = Date().currentTimestamp()
        client.create(title: String(timestamp), imageData: imgBase64, location: currentLocation) { post in
            print(post)
        }
    }
    
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    //Función del delegate que se da cuenta cuando ya escogiste/tomaste una imagen/foto.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        pickedImage.image = image
        dismiss(animated:true, completion: nil)
    }
}

extension CameraViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.currentLocation = locations.last
    }
}
