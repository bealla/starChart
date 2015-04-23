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
        var periodList = [p1.text,p2.text,p3.text,p4.text,p5.text,p6.text,p7.text,p8.text,p9.text,p10.text]
        println ("save student")
        
        let contactDB = FMDatabase(path: databasePath as String)
        
        if contactDB.open() {
            
            let insertSQL = "INSERT OR IGNORE INTO STUDENT (name) VALUES ('\(first.text)');"
            
            let result = contactDB.executeUpdate(insertSQL,
                withArgumentsInArray: nil)
            
            if !result {
                status.text = "Failed to add student name"
                println("Error: \(contactDB.lastErrorMessage())")
            } else {
                status.text = "Student Added"
                //first.text = ""
            }
        } else {
            println("Error: \(contactDB.lastErrorMessage())")
        }
        
        /*for index in 1...10{
            if contactDB.open() {
                println(index)
                let querySQL = "INSERT INTO STUDENTCLASS(sid, cid, period) SELECT STUDENT.id,COURSES.id, '\(index)' FROM STUDENT,COURSES WHERE COURSES.name = ('\(periodList[index-1])') AND STUDENT.name = ('\(first.text)');"
                
                let results:FMResultSet? = contactDB.executeQuery(querySQL,
                    withArgumentsInArray: nil)
                
                if results?.next() == true {
                    //p1.text = results?.stringForColumn("name")
                    //p2.text = results?.stringForColumn("name")
                    //p3.text = results?.stringForColumn("name")
                    println(results?.stringForColumn("name"))
                    //currentClassList[index-1] = results?.stringForColumn("name")
                    status.text = "Class List Initialized"
                } else {
                    status.text = "Class List Not Initialized"
                    p1.text = ""
                    //phone.text = "" AND STUDENTCLASS.period = '\(index)'
                }
                contactDB.close()
            } else {
                println("Error: \(contactDB.lastErrorMessage())")
            }
        }*/
        studentName()
    }
    
    @IBAction func deleteStudent(sender: AnyObject) {
        let starchartDB = FMDatabase(path: databasePath as String)
        if starchartDB.open() {
            let sql_stmt = "DELETE FROM STUDENT WHERE name = '\(first.text)';"
            if !starchartDB.executeStatements(sql_stmt) {
                println("Error: \(starchartDB.lastErrorMessage())")
            }
            starchartDB.close()
        } else {
            println("Error: \(starchartDB.lastErrorMessage())")
        }
        
        studentName()
    }
    
    func studentName(){
        //looks up all the students listed in the database
        let contactDB = FMDatabase(path: databasePath as String)
        
        if contactDB.open() {
            
            let querySQL = "SELECT name FROM STUDENT;"
            
            let results:FMResultSet? = contactDB.executeQuery(querySQL,
                withArgumentsInArray: nil)
            
            while results?.next() == true {
                println(results?.stringForColumn("name"))
            }
        } else {
            println("Error: \(contactDB.lastErrorMessage())")
        }
    }
    
    func studentClasses(){
        //looks up all the students listed in the database
        let contactDB = FMDatabase(path: databasePath as String)
        
        if contactDB.open() {
            
            let querySQL = "SELECT cid, sid FROM STUDENTCLASS;"
            
            let results:FMResultSet? = contactDB.executeQuery(querySQL,
                withArgumentsInArray: nil)
            
            while results?.next() == true {
                print("Next entry: ")
                print(results?.stringForColumn("cid"))
                print(results?.stringForColumn("sid"))
                println("")
            }
        } else {
            println("Error: \(contactDB.lastErrorMessage())")
        }
    }
    
    @IBAction func findStudent(sender: AnyObject) {
        //looks to see if student already exists, populates class data
        println("find student")
        
        var currentClassList = [p1.text,p2.text,p3.text,p4.text,p5.text,p6.text,p7.text,p8.text,p9.text,p10.text]
        
        let contactDB = FMDatabase(path: databasePath as String)
        
        for index in 1...10{
            if contactDB.open() {
                //println(index)
                let querySQL = "SELECT name FROM COURSES WHERE COURSES.id = (SELECT cid FROM STUDENTCLASS WHERE period = \(index) AND sid = (SELECT STUDENT.id FROM STUDENT WHERE name = '\(first.text)'));"
                //"SELECT COURSES.name FROM COURSES WHERE COURSES.id IN (SELECT STUDENTCLASS.period FROM STUDENTCLASS WHERE STUDENTCLASS.period = \(index) IN (SELECT STUDENTCLASS.id FROM STUDENTCLASS WHERE STUDENTCLASS.id IN (SELECT STUDENT.id FROM STUDENT WHERE name = '\(first.text)')));"
                
                let results:FMResultSet? = contactDB.executeQuery(querySQL,
                    withArgumentsInArray: nil)
                
                if results?.next() == true {
                    //println(results?.stringForColumn("name"))
                    currentClassList[index-1] = results?.stringForColumn("name")
                    status.text = "Record Found"
                    p1.text = ""
                    p2.text = ""
                    p3.text = ""
                    p4.text = ""
                    p5.text = ""
                    p6.text = ""
                    p7.text = ""
                    p8.text = ""
                    p9.text = ""
                    p10.text = ""
                } else {
                    status.text = "Record not found"
                    p1.text = ""
                    //phone.text = "" AND STUDENTCLASS.period = '\(index)'
                }
                contactDB.close()
            } else {
                println("Error: \(contactDB.lastErrorMessage())")
            }
        }
        println(currentClassList)
        //add the currentClassList to the text boxes
        p1.text = currentClassList[0]
        p2.text = currentClassList[1]
        p3.text = currentClassList[2]
        p4.text = currentClassList[3]
        p5.text = currentClassList[4]
        p6.text = currentClassList[5]
        p7.text = currentClassList[6]
        p8.text = currentClassList[7]
        p9.text = currentClassList[8]
        p10.text = currentClassList[9]
        
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
        var periodList = [p1.text,p2.text,p3.text,p4.text,p5.text,p6.text,p7.text,p8.text,p9.text,p10.text]
        println(periodList)
        
        let contactDB = FMDatabase(path: databasePath as String)
        for index in 1...10{
            if contactDB.open() {
                println(index)
                println(periodList[index-1])
                
                let insertSQL = "INSERT INTO STUDENTCLASS(sid, cid, period) SELECT STUDENT.id,COURSES.id, '\(index)' FROM STUDENT,COURSES WHERE STUDENT.name = ('\(first.text)') AND COURSES.name = ('\(periodList[index-1])') ;"
                
                let result = contactDB.executeUpdate(insertSQL,
                    withArgumentsInArray: nil)
                
                if !result {
                    status.text = "Failed to add student class"
                    println("Error: \(contactDB.lastErrorMessage())")
                } else {
                    status.text = "Course Added"
                    //p1.text = ""
                }
            } else {
                println("Error: \(contactDB.lastErrorMessage())")
            }
            
        }
        studentClasses()
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
            let sql_stmt = "CREATE TABLE IF NOT EXISTS STUDENT (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT UNIQUE); CREATE TABLE IF NOT EXISTS STUDENTCLASS (ID INTEGER PRIMARY KEY AUTOINCREMENT, SID INTEGER, CID INTEGER, PERIOD INTEGER);"
            if !starchartDB.executeStatements(sql_stmt) {
                println("Error: \(starchartDB.lastErrorMessage())")
            }
            starchartDB.close()
        } else {
            println("Error: \(starchartDB.lastErrorMessage())")
        }
        
        /*if starchartDB.open() {
            let sql_stmt = "DROP TABLE COURSES;"
            if !starchartDB.executeStatements(sql_stmt) {
                println("Error: \(starchartDB.lastErrorMessage())")
            }
            starchartDB.close()
        } else {
            println("Error: \(starchartDB.lastErrorMessage())")
        }*/
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