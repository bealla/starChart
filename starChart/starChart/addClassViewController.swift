//
//  addClassViewController.swift
//  starChart
//
//  Created by Alexandra Beall on 4/20/15.
//  Copyright (c) 2015 Alexandra Beall. All rights reserved.
//

import UIKit

class addClassViewController: UIViewController {
    let tableData = ["One","Two","Three"]
    
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var classname: UITextField!
    var databasePath = NSString()
    
    @IBOutlet weak var tableView: UITableView!
    
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
        let starchartDB = FMDatabase(path: databasePath as String)
        if starchartDB.open() {
            let sql_stmt = "CREATE TABLE IF NOT EXISTS COURSES (ID INTEGER PRIMARY KEY AUTOINCREMENT, CID MEDIUMINT AUTO_INCREMENT, NAME TEXT, BEGIN DATE, END DATE)"
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
    
    @IBAction func enterClass(sender: AnyObject) {
        //textbox to recieve class
        
    }
    
    //onclick save, add course title to database, SQL
    @IBAction func saveClassInfo(sender: AnyObject) {
        
        let contactDB = FMDatabase(path: databasePath as String)
        
        if contactDB.open() {
            
            let insertSQL = "INSERT INTO COURSES (name) VALUES ('\(classname.text)')"
            
            let result = contactDB.executeUpdate(insertSQL,
                withArgumentsInArray: nil)
            
            if !result {
                status.text = "Failed to add class name"
                println("Error: \(contactDB.lastErrorMessage())")
            } else {
                status.text = "Class Added"
                classname.text = ""
            }
        } else {
            println("Error: \(contactDB.lastErrorMessage())")
        }
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
