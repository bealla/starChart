//
//  studentprofileViewController.swift
//  starChart
//
//  Created by Alexandra Beall on 4/21/15.
//  Copyright (c) 2015 Alexandra Beall. All rights reserved.
//

import UIKit

class studentprofileViewController: UIViewController {
    //let topbarColor = UIColor(red:70.0, green:24.0,blue:76.0,alpha:1.0)
    
    
    @IBOutlet weak var rainbowLevel: UIImageView!
    @IBOutlet weak var redLevel: UIImageView!
    @IBOutlet weak var yellowLevel: UIImageView!
    @IBOutlet weak var greenLevel: UIImageView!
    @IBOutlet weak var commentBoxBackground: UIImageView!
    
    //beahvior text labels
    @IBOutlet weak var behavior1: UILabel!
    
    @IBOutlet weak var behavior2: UILabel!
    
    @IBOutlet weak var behavior3: UILabel!
    
    
    //behavior 1 coin images
    @IBOutlet weak var b1s1: UIImageView!
    @IBOutlet weak var b1s2: UIImageView!
    @IBOutlet weak var b1s3: UIImageView!
    
    
    //behavior 2 coin images
    @IBOutlet weak var b2s1: UIImageView!
    
    @IBOutlet weak var b2s2: UIImageView!
    
    @IBOutlet weak var b2s3: UIImageView!
    
    //behavior 2 coin images
    
    @IBOutlet weak var b3s1: UIImageView!
    
    
    @IBOutlet weak var b3s2: UIImageView!
    
    @IBOutlet weak var b3s3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func filStar(){
        //KATE
        //set each part of star tail to visible as stars are earned and tracked in database and set each image to filled if stored in database
    }
    
    
    
    
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}