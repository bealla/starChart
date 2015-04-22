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
    
    @IBOutlet weak var first: UITextField!
    @IBOutlet weak var last: UITextField!
    @IBOutlet weak var suffix: UITextField!
    @IBOutlet weak var status: UILabel!
    
    
    var databasePath = NSString()
    
   /* @IBAction func deleteStudent(sender: AnyObject) {
        //remove inactive student, or store as inactive, SQL
        
    }*/
    
    
    @IBAction func saveStudentProfile(sender: AnyObject) {
        //add student profile informatoin to databases, SQL when press save
        //var name: String = first.text + " " + last.text + " " + suffix.text
        println ("save student")
        
        let contactDB = FMDatabase(path: databasePath as String)
        
        if contactDB.open() {
            
            let insertSQL = "INSERT INTO STUDENT (name) VALUES ('\(first.text)')"
            
            let result = contactDB.executeUpdate(insertSQL,
                withArgumentsInArray: nil)
            
            if !result {
                status.text = "Failed to add student name"
                println("Error: \(contactDB.lastErrorMessage())")
            } else {
                status.text = "Student Added"
                first.text = ""
            }
        } else {
            println("Error: \(contactDB.lastErrorMessage())")
        }
    }
    
    @IBAction func courseTitleSelector(sender: AnyObject) {
        //popup will show up with classes populated from added clases in db, select class
        println ("course title select")
        
    }
    
    
    @IBAction func coursePeriodSelector(sender: AnyObject) {
        // //popup will show up with numbers 1-6, select corresponding period, for now lets just add classes, i think we can implement a stepper I just don't have that done yet
        println ("course period select")
    }
    
    
    @IBAction func addClass(sender: AnyObject) {
        //add class to db, eventually display below for user to see
        println ("add class")
    }
    
    
    @IBAction func removeCourse(sender: AnyObject) {
        //remove selected class from db, and eventually from display down below
        println ("remove class")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.imageView.backgroundColor = UIColor.redColor()
        let filemgr = NSFileManager.defaultManager()
        let dirPaths =
        NSSearchPathForDirectoriesInDomains(.DocumentDirectory,
            .UserDomainMask, true)
        
        let docsDir = dirPaths[0] as String
        
        databasePath = docsDir.stringByAppendingPathComponent(
            "starchart.db")
        
        
        if !filemgr.fileExistsAtPath(databasePath as String) { //does database exist?
            let starchartDB = FMDatabase(path: databasePath as String)
            
            if starchartDB == nil {
                println("Error: \(starchartDB.lastErrorMessage())")
            }
        }
        println ("adding table?")
        let starchartDB = FMDatabase(path: databasePath as String)
        if starchartDB.open() {
            let sql_stmt = "CREATE TABLE IF NOT EXISTS STUDENT (ID INTEGER PRIMARY KEY AUTOINCREMENT, SID MEDIUMINT AUTO_INCREMENT, NAME TEXT)"
            if !starchartDB.executeStatements(sql_stmt) {
                println("Error: \(starchartDB.lastErrorMessage())")
            }
            starchartDB.close()
        } else {
            println("Error: \(starchartDB.lastErrorMessage())")
        }
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