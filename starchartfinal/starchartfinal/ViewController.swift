//
//  ViewController.swift
//  starchartfinal
//
//  Created by Alexandra Beall on 4/21/15.
//  Copyright (c) 2015 Alexandra Beall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //let barColor = UIColor(red:70, green:24,blue:76,alpha:1.0)

    //@IBOutlet weak var starchart: UIImageView!
    //starchart.backgroundColor = UIColor.redColor()
    
   let imageView = UIImageView(frame: CGRectMake(0, 0, 100, 100))
    self.imageView.backgroundColor = UIColor.redColor()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

