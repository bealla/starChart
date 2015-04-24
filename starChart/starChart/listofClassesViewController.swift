//
//  listofClassesViewController.swift
//  starChart
//
//  Created by Alexandra Beall on 4/20/15.
//  Copyright (c) 2015 Alexandra Beall. All rights reserved.
//

import UIKit

var activeClass = "TESTINGCLASS"

class listofClassesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var databasePath = NSString()
    
    @IBOutlet weak var classList: UITableView!
    
    //when student selected go to rateStudentview controller and populate accordingly
    var tableData = ["one", "two", "", "", "", "", "", "", "", ""]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Return the number of rows in the section
        return tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)  -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("classNameCell") as UITableViewCell
        
        cell.textLabel?.text = tableData[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        activeClass = tableData[indexPath.row]
        println(activeClass)
    }
    
    func retrieveStudentClassList(){
        //looks up all the student's classes listed in the database
        let contactDB = FMDatabase(path: databasePath as String)
        
        var i = 0

            if contactDB.open() {
                
                let querySQL = "SELECT name FROM COURSES WHERE COURSES.id = (SELECT cid FROM STUDENTCLASS WHERE sid = (SELECT STUDENT.id FROM STUDENT WHERE name = '\(activeStudent)'));"
                
                let results:FMResultSet = contactDB.executeQuery(querySQL,
                    withArgumentsInArray: nil)
                
                while results.next() == true {
                    println(results.stringForColumn("name"))
                    tableData[i] = results.stringForColumn("name")
                    i += 1
                }
            } else {
                println("Error: \(contactDB.lastErrorMessage())")
            }
        println(tableData)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        //println ("adding table?")
        let starchartDB = FMDatabase(path: databasePath as String)
        if starchartDB.open() {
            let sql_stmt = "CREATE TABLE IF NOT EXISTS COURSES (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT UNIQUE); CREATE TABLE IF NOT EXISTS STUDENT (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT UNIQUE); CREATE TABLE IF NOT EXISTS STUDENTCLASS (ID INTEGER PRIMARY KEY AUTOINCREMENT, SID INTEGER, CID INTEGER, PERIOD INTEGER);"
            if !starchartDB.executeStatements(sql_stmt) {
                println("Error: \(starchartDB.lastErrorMessage())")
            }
            starchartDB.close()
        } else {
            println("Error: \(starchartDB.lastErrorMessage())")
        }
        
        retrieveStudentClassList()
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
