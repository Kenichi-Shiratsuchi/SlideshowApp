//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 白土顕一 on 2021/04/28.
//

import UIKit

class ResultViewController: UIViewController {
   
    
    // imageViewの割り付け
    @IBOutlet weak var imageView2: UIImageView!

   
    var image : UIImage!
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView2.image = image
       
        
        // Do any additional setup after loading the view.
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
