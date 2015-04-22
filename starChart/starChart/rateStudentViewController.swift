//
//  rateStudentViewController.swift
//  starChart
//
//  Created by Alexandra Beall on 4/21/15.
//  Copyright (c) 2015 Alexandra Beall. All rights reserved.
//

import UIKit

class rateStudentViewController: UIViewController {
    
    
    @IBOutlet weak var b1s1: UIImageView!
    
    @IBOutlet weak var b1s2: UIImageView!
    
    @IBOutlet weak var b1s3: UIImageView!
    
    
    @IBOutlet weak var b2s1: UIImageView!
    
    @IBOutlet weak var b2s2: UIImageView!
    
    @IBOutlet weak var b2s3: UIImageView!
    
    
    @IBOutlet weak var b3s1: UIImageView!
    @IBOutlet weak var b3s2: UIImageView!
    
    @IBOutlet weak var b3s3: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var textBox: UITextView!
    @IBAction func b1s1button(sender: AnyObject) {
        b1s1.image = UIImage(named: ("starclicked.png"))
        b1s2.image = UIImage(named: ("unclickedStar.png"))
        b1s3.image = UIImage(named: ("unclickedStar.png"))
    }
    @IBAction func b1s2button(sender: AnyObject) {
        b1s1.image = UIImage(named: ("starclicked.png"))
        b1s2.image = UIImage(named: ("starclicked.png"))
        b1s3.image = UIImage(named: ("unclickedStar.png"))
    }
    @IBAction func b1s3button(sender: AnyObject) {
        b1s1.image = UIImage(named: ("starclicked.png"))
        b1s2.image = UIImage(named: ("starclicked.png"))
        b1s3.image = UIImage(named: ("starclicked.png"))
    }
    @IBAction func b2s2button(sender: AnyObject) {
        b2s1.image = UIImage(named: ("starclicked.png"))
        b2s2.image = UIImage(named: ("unclickedStar.png"))
        b2s3.image = UIImage(named: ("unclickedStar.png"))
    }
    @IBAction func b2s3button(sender: AnyObject) {
        b2s1.image = UIImage(named: ("starclicked.png"))
        b2s2.image = UIImage(named: ("starclicked.png"))
        b2s3.image = UIImage(named: ("unclickedStar.png"))
    }
    
    @IBAction func b3s1button(sender: AnyObject) {
        b2s1.image = UIImage(named: ("starclicked.png"))
        b2s2.image = UIImage(named: ("starclicked.png"))
        b2s3.image = UIImage(named: ("starclicked.png"))
    }
    @IBAction func b3s2button(sender: AnyObject) {
        b3s1.image = UIImage(named: ("starclicked.png"))
        b3s2.image = UIImage(named: ("unclickedStar.png"))
        b3s3.image = UIImage(named: ("unclickedStar.png"))
    }
    
    @IBAction func b3s3button(sender: AnyObject) {
        b3s1.image = UIImage(named: ("starclicked.png"))
        b3s2.image = UIImage(named: ("starclicked.png"))
        b3s3.image = UIImage(named: ("unclickedStar.png"))
        
        //b3s1.image = UIImage(named: ("starclicked.png"))
        //b3s2.image = UIImage(named: ("starclicked.png"))
        //b3s3.image = UIImage(named: ("starclicked.png"))
    }
    @IBAction func save(sender: AnyObject) {
        //add star/comment info to DB
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