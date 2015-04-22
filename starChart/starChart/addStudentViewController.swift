//
//  addStudentViewController.swift
//  starChart
//
//  Created by Alexandra Beall on 4/20/15.
//  Copyright (c) 2015 Alexandra Beall. All rights reserved.
//

import UIKit

class addStudentViewController: UIViewController {
    let imageView = UIImageView(frame: CGRectMake(0, 0, 100, 100))
    
    @IBAction func deleteStudent(sender: AnyObject) {
        //remove inactive student, or store as inactive, SQL
        
    }
    
    
    @IBAction func saveStudentProfile(sender: AnyObject) {
        //add student profile informatoin to databases, SQL when press save
    }
    
    @IBAction func courseTitleSelector(sender: AnyObject) {
        //popup will show up with classes populated from added clases in db, select class
    }
    
    
    @IBAction func coursePeriodSelector(sender: AnyObject) {
        // //popup will show up with numbers 1-6, select corresponding period, for now lets just add classes, i think we can implement a stepper I just don't have that done yet
    }
    
    
    @IBAction func addClass(sender: AnyObject) {
        //add class to db, eventually display below for user to see
    }
    
    
    @IBAction func removeCourse(sender: AnyObject) {
        //remove selected class from db, and eventually from display down below
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.imageView.backgroundColor = UIColor.redColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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