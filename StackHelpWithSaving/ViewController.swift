//
//  ViewController.swift
//  StackHelpWithSaving
//
//  Created by Igor on 12/08/16.
//  Copyright © 2016 Igor Kislyuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imageURL: NSURL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionShowPicker(sender: AnyObject) {
        let pickerViewController = UIImagePickerController()
        pickerViewController.sourceType = .PhotoLibrary
        pickerViewController.delegate = self
        presentViewController(pickerViewController, animated: true, completion: nil)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toSecondViewController" {

            if let destinationVC = segue.destinationViewController as? SecondViewController {
                destinationVC.imageURL = imageURL
            }
            
        }
    }
    
    
}

extension ViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        var image: UIImage?
        if let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            image = originalImage
        } else if let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            image = editedImage
        } else {
            image = nil
            print("no image to assigning")
        }
        
        if let image = image {
            imageView.image = image
            
            //save image and pass link
            // to retrieve it later
            
            let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
            assert(path.count > 0)
            let documentDirectory = path[0]
            print(documentDirectory)
            
            
            let imagePathString = NSUUID().UUIDString + ".jpg"
            if let documentURL = NSURL(string: documentDirectory) {
                
                let imageURL = documentURL.URLByAppendingPathComponent(imagePathString)
                
                    if let data = UIImageJPEGRepresentation(image, 0.9) {
                        data.writeToFile(imageURL.path!, atomically: true)
                    }
                    
                    self.imageURL = imageURL
                    
                
            }
            
            
            
            
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}