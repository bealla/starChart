//
//  studentprofileViewController.swift
//  starChart
//
//  Created by Alexandra Beall on 4/21/15.
//  Copyright (c) 2015 Alexandra Beall. All rights reserved.
//

import UIKit

var activeStudent = "TESTING"


class studentprofileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var databasePath = NSString()
    @IBOutlet var listofStudents: UITableView!
    
    //when student selected go to rateStudentview controller and populate accordingly
    var tableData = ["one", "two", "", "", "", "", "", "", "", ""]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Return the number of rows in the section
        return tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)  -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("studentNameCell") as UITableViewCell
        
        cell.textLabel?.text = tableData[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        activeStudent = tableData[indexPath.row]
        println(activeStudent)
    }
    
    func studentName(){
        //looks up all the students listed in the database
        let contactDB = FMDatabase(path: databasePath as String)
        
        var i = 0
        
        if contactDB.open() {
            
            let querySQL = "SELECT name FROM STUDENT;"
            
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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //println("HERE")
        
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
        
        studentName()
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