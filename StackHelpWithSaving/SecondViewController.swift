//
//  SecondViewController.swift
//  StackHelpWithSaving
//
//  Created by Igor on 12/08/16.
//  Copyright © 2016 Igor Kislyuk. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var imageURL: NSURL?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()


        if let imageURL = imageURL {
            if let image = UIImage(contentsOfFile: imageURL.path!) {
                imageView.image = image
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
