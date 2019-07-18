//
//  zoomViewController.swift
//  SlideshowApp
//
//  Created by Taka on 7/18/19.
//  Copyright © 2019 Taka. All rights reserved.
//

import UIKit

class zoomViewController: UIViewController {
    
    @IBOutlet weak var zoomImage: UIImageView!
    var picture: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zoomImage.image = self.picture

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
