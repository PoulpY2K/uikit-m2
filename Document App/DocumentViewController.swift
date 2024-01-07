//
//  DocumentViewController.swift
//  Document App
//
//  Created by Jérémy Laurent on 07/01/2024.
//

import UIKit

class DocumentViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var imageName: String?
    
    override func viewDidLoad() {
        imageView.image = imageName != nil ? UIImage(named: imageName!) : nil
    }
}
