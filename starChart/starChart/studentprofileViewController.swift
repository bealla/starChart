//
//  studentprofileViewController.swift
//  starChart
//
//  Created by Alexandra Beall on 4/21/15.
//  Copyright (c) 2015 Alexandra Beall. All rights reserved.
//

import UIKit

class studentprofileViewController: UIViewController {
  

    @IBOutlet var listofStudents: UITableView!
    //when student selected go to rateStudentview controller and populate accordingly

  
    
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
