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
    @IBOutlet weak var currentStudent: UIButton!
    
    @IBAction func viewStudents(sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    
    //set button "view/currentStudent" text to name selected from list of students talbe from datacase
    //currentStudent.text = "\(pull name from database and instert here)"
    
 /*   //displaying stars/recording them in database
   // if (there is star info in db for student){
    for (each behavior in db){
  //    switch (amount of stars from db) {
    case 1:{
    b1s1.image = UIImage(named: ("starclicked.png"))
    b1s2.image = UIImage(named: ("unclickedStar.png"))
    b1s3.image = UIImage(named: ("unclickedStar.png"))
    
    }
    case 2:{
    b1s1.image = UIImage(named: ("starclicked.png"))
    b1s2.image = UIImage(named: ("starclicked.png"))
    b1s3.image = UIImage(named: ("unclickedStar.png"))
    
    }
    case 3: {
    b1s1.image = UIImage(named: ("starclicked.png"))
    b1s2.image = UIImage(named: ("starclicked.png"))
    b1s3.image = UIImage(named: ("starclicked.png"))
    
    }
    
    }
} else{

  
    @IBOutlet weak var textBox: UITextView!
    @IBAction func b1s1button(sender: AnyObject) {
        b1s1.image = UIImage(named: ("starclicked.png"))
        b1s2.image = UIImage(named: ("unclickedStar.png"))
        b1s3.image = UIImage(named: ("unclickedStar.png"))
        //save amount in database
        //update total number of stars for rainbow
    }
    @IBAction func b1s2button(sender: AnyObject) {
        b1s1.image = UIImage(named: ("starclicked.png"))
        b1s2.image = UIImage(named: ("starclicked.png"))
        b1s3.image = UIImage(named: ("unclickedStar.png"))
        //save amount in database
        //update total number of stars for rainbow
    }
    @IBAction func b1s3button(sender: AnyObject) {
        b1s1.image = UIImage(named: ("starclicked.png"))
        b1s2.image = UIImage(named: ("starclicked.png"))
        b1s3.image = UIImage(named: ("starclicked.png"))
        //save amount in database
        //update total number of stars for rainbow
    }
    @IBAction func b2s2button(sender: AnyObject) {
        b2s1.image = UIImage(named: ("starclicked.png"))
        b2s2.image = UIImage(named: ("unclickedStar.png"))
        b2s3.image = UIImage(named: ("unclickedStar.png"))
        //save amount in database
        //update total number of stars for rainbow
    }
    @IBAction func b2s3button(sender: AnyObject) {
        b2s1.image = UIImage(named: ("starclicked.png"))
        b2s2.image = UIImage(named: ("starclicked.png"))
        b2s3.image = UIImage(named: ("unclickedStar.png"))
        //save amount in database
        //update total number of stars for rainbow
    }
    
    @IBAction func b3s1button(sender: AnyObject) {
        b2s1.image = UIImage(named: ("starclicked.png"))
        b2s2.image = UIImage(named: ("starclicked.png"))
        b2s3.image = UIImage(named: ("starclicked.png"))
        //save amount in database
        //update total number of stars for rainbow
    }
    @IBAction func b3s2button(sender: AnyObject) {
        b3s1.image = UIImage(named: ("starclicked.png"))
        b3s2.image = UIImage(named: ("unclickedStar.png"))
        b3s3.image = UIImage(named: ("unclickedStar.png"))
        //save amount in database
        //update total number of stars for rainbow
    }
    
    @IBAction func b3s3button(sender: AnyObject) {
        b3s1.image = UIImage(named: ("starclicked.png"))
        b3s2.image = UIImage(named: ("starclicked.png"))
        b3s3.image = UIImage(named: ("unclickedStar.png"))
        //save amount in database
        //update total number of stars for rainbow
        
        //b3s1.image = UIImage(named: ("starclicked.png"))
        //b3s2.image = UIImage(named: ("starclicked.png"))
        //b3s3.image = UIImage(named: ("starclicked.png"))
    }
}

// if (comment saved in db) {
 //update text in textBox
//} else{
// @IBAction func save(sender: AnyObject) {
        //add star/comment info to DB
   // }
//} */



}
