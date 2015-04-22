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
    @IBOutlet weak var p1: UITextField!
    @IBOutlet weak var p2: UITextField!
    @IBOutlet weak var p3: UITextField!
    @IBOutlet weak var p4: UITextField!
    @IBOutlet weak var p5: UITextField!
    @IBOutlet weak var p6: UITextField!
    @IBOutlet weak var p7: UITextField!
    @IBOutlet weak var p8: UITextField!
    @IBOutlet weak var p9: UITextField!
    @IBOutlet weak var p10: UITextField!
    
    //var name: String = first.text + " " + last.text + " " + suffix.text
    
    
    
    var databasePath = NSString()
    
   /* @IBAction func deleteStudent(sender: AnyObject) {
        //remove inactive student, or store as inactive, SQL
        
    }*/
    
    
    @IBAction func saveStudentProfile(sender: AnyObject) {
        //add student profile informatoin to databases, SQL when press save
        
        println ("save student")
        
        let contactDB = FMDatabase(path: databasePath as String)
        
        if contactDB.open() {
            
            let insertSQL = "INSERT INTO STUDENT (name) VALUES ('\(first.text)');"
            
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
    
    @IBAction func findStudent(sender: AnyObject) {
        //looks to see if student already exists, populates class data
        println("find student")
        let contactDB = FMDatabase(path: databasePath as String)
        
        if contactDB.open() {
            //"SELECT address, phone FROM CONTACTS WHERE name = '\(name.text)'"
            let querySQL = "SELECT COURSES.name FROM COURSES WHERE COURSES.id IN (SELECT STUDENTCLASS.id FROM STUDENTCLASS WHERE STUDENTCLASS.id IN (SELECT STUDENT.id FROM STUDENT WHERE name = '\(first.text)'));"
            
            let results:FMResultSet? = contactDB.executeQuery(querySQL,
                withArgumentsInArray: nil)
            
            if results?.next() == true {
                p1.text = results?.stringForColumn("name")
                println(results?.stringForColumn("name"))
                //phone.text = results?.stringForColumn("phone")
                status.text = "Record Found"
            } else {
                status.text = "Record not found"
                p1.text = ""
                //phone.text = ""
            }
            contactDB.close()
        } else {
            println("Error: \(contactDB.lastErrorMessage())")
        }
    }
    
    /*@IBAction func courseTitleSelector(sender: AnyObject) {
        //popup will show up with classes populated from added clases in db, select class
        println ("course title select")
        
    }
    
    
    @IBAction func coursePeriodSelector(sender: AnyObject) {
        // //popup will show up with numbers 1-6, select corresponding period, for now lets just add classes, i think we can implement a stepper I just don't have that done yet
        println ("course period select")
    }*/
    
    
    @IBAction func addClass(sender: AnyObject) {
        //add class to db, eventually display below for user to see
        println ("add class")
        
        let contactDB = FMDatabase(path: databasePath as String)
        
        if contactDB.open() {
            
            let insertSQL = "INSERT OR REPLACE INTO STUDENTCLASS(sid, cid, period) SELECT STUDENT.id,COURSES.id, 1 FROM STUDENT,COURSES WHERE COURSES.name = ('\(p1.text)') AND STUDENT.name = ('\(first.text)'); INSERT OR REPLACE INTO STUDENTCLASS(sid, cid, period) SELECT STUDENT.id,COURSES.id, 2 FROM STUDENT,COURSES WHERE COURSES.name = ('\(p2.text)') AND STUDENT.name = ('\(first.text)'); INSERT OR REPLACE INTO STUDENTCLASS(sid, cid, period) SELECT STUDENT.id,COURSES.id, 3 FROM STUDENT,COURSES WHERE COURSES.name = ('\(p3.text)') AND STUDENT.name = ('\(first.text)'); INSERT OR REPLACE INTO STUDENTCLASS(sid, cid, period) SELECT STUDENT.id,COURSES.id, 4 FROM STUDENT,COURSES WHERE COURSES.name = ('\(p4.text)') AND STUDENT.name = ('\(first.text)'); INSERT OR REPLACE INTO STUDENTCLASS(sid, cid, period) SELECT STUDENT.id,COURSES.id, 5 FROM STUDENT,COURSES WHERE COURSES.name = ('\(p5.text)') AND STUDENT.name = ('\(first.text)'); INSERT OR REPLACE INTO STUDENTCLASS(sid, cid, period) SELECT STUDENT.id,COURSES.id, 6 FROM STUDENT,COURSES WHERE COURSES.name = ('\(p6.text)') AND STUDENT.name = ('\(first.text)'); INSERT OR REPLACE INTO STUDENTCLASS(sid, cid, period) SELECT STUDENT.id,COURSES.id, 7 FROM STUDENT,COURSES WHERE COURSES.name = ('\(p7.text)') AND STUDENT.name = ('\(first.text)'); INSERT OR REPLACE INTO STUDENTCLASS(sid, cid, period) SELECT STUDENT.id,COURSES.id, 8 FROM STUDENT,COURSES WHERE COURSES.name = ('\(p8.text)') AND STUDENT.name = ('\(first.text)'); INSERT OR REPLACE INTO STUDENTCLASS(sid, cid, period) SELECT STUDENT.id,COURSES.id, 9 FROM STUDENT,COURSES WHERE COURSES.name = ('\(p9.text)') AND STUDENT.name = ('\(first.text)'); INSERT OR REPLACE INTO STUDENTCLASS(sid, cid, period) SELECT STUDENT.id,COURSES.id, 10 FROM STUDENT,COURSES WHERE COURSES.name = ('\(p10.text)') AND STUDENT.name = ('\(first.text)');"
            
            let result = contactDB.executeUpdate(insertSQL,
                withArgumentsInArray: nil)
            
            if !result {
                status.text = "Failed to add student class"
                println("Error: \(contactDB.lastErrorMessage())")
            } else {
                status.text = "Course Added"
                p1.text = ""
            }
        } else {
            println("Error: \(contactDB.lastErrorMessage())")
        }
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
            let sql_stmt = "CREATE TABLE IF NOT EXISTS STUDENT (ID INTEGER PRIMARY KEY AUTOINCREMENT, SID INTEGER AUTOINCREMENT, NAME TEXT); CREATE TABLE IF NOT EXISTS STUDENTCLASS (ID INTEGER PRIMARY KEY AUTOINCREMENT, SID INTEGER, CID INTEGER, PERIOD INTEGER);"
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