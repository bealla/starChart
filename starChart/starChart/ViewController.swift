//
//  ViewController.swift
//  starChart
//
//  Created by Alexandra Beall on 4/17/15.
//  Copyright (c) 2015 Alexandra Beall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var titlebar: UIImageView!
    
    @IBOutlet weak var studentname: UIImageView!
    
    @IBOutlet weak var classes: UIImageView!
    
    
    @IBOutlet weak var starbarContainer: UIImageView!
    
    
    @IBOutlet weak var behavior1Label: UILabel!
    
    
    @IBOutlet weak var behavior2Label: UILabel!
    
    @IBOutlet weak var behavior3Label: UILabel!
    
    @IBOutlet weak var appTitle: UILabel!
    
    
    @IBOutlet weak var b1s1: UIImageView!
    
    @IBAction func b1s1button(sender: AnyObject) {
      //  b1s1.image = UIImageView(named: "starclicked.png")
    }
    
  
    
    @IBAction func hamButton(sender: AnyObject) {
    }
    
    @IBAction func viewStudents(sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

