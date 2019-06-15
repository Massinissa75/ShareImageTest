//
//  ViewController.swift
//  ShareImageTest
//
//  Created by Massinissa_theking on 15/06/2019.
//  Copyright © 2019 Massinissa_theking. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    
    let imagePick = UIImagePickerController()
    var currentBtn: UIButton?
    
    @IBOutlet weak var addImageBtn: UIButton!
    
    @IBOutlet weak var shareImageBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func imagePicker(_sender: UIButton){
        
        currentBtn = _sender
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = true
        self.present(image, animated: true, completion: nil)
        }
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
            
        self.dismiss(animated: true, completion: nil)
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[UIImagePickerController.InfoKey: Any]){
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        if let button = currentBtn{
                button.setImage(image, for: .normal)
                button.imageView?.contentMode = .scaleAspectFit
        }
        self.dismiss(animated: true, completion: nil)
        }
 
    @IBAction func shareButton(_sender:UIButton){
            
        let imageShare = [imagePick]
        let activityViewController = UIActivityViewController(activityItems: imageShare , applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
        }
}

