//
//  ViewController.swift
//  starChart
//
//  Created by Alexandra Beall on 4/17/15.
//  Copyright (c) 2015 Alexandra Beall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var appTitleBar: UIImageView!
    
    @IBOutlet weak var appLabel: UILabel!
    
    @IBOutlet weak var topBar: UIImageView!
    
    @IBOutlet weak var classesBar: UIImageView!
    
    @IBOutlet weak var starContainer: UIImageView!
    
    
    @IBOutlet weak var behavior1: UILabel!
    
    @IBOutlet weak var behavior2: UILabel!
    
    @IBOutlet weak var behavior3: UILabel!
    
    
    //@IBOutlet weak var b1s1: UIImageView!

   
 
    
   // @IBOutlet weak var b1s1: UIButton!
  
 

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var phone: UITextField!
    
    var databasePath = NSString()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
           }
  
   
    //@IBAction func b1s1pressed(sender: AnyObject) {
      //  b1s1.image = UIImage(named: "starclicked.png")
   // }

        let filemgr = NSFileManager.defaultManager()
        let dirPaths =
        NSSearchPathForDirectoriesInDomains(.DocumentDirectory,
            .UserDomainMask, true)
        
        let docsDir = dirPaths[0] as String
        
        databasePath = docsDir.stringByAppendingPathComponent(
        "contacts.db")
        
        if !filemgr.fileExistsAtPath(databasePath as String) {
            
            let contactDB = FMDatabase(path: databasePath as String)
            
            if contactDB == nil {
                println("Error: \(contactDB.lastErrorMessage())")
            }
            
            if contactDB.open() {
                let sql_stmt = "CREATE TABLE IF NOT EXISTS STUDENT (ID INTEGER PRIMARY KEY AUTOINCREMENT, SID MEDIUMINT NOT NULL AUTO_INCREMENT, NAME TEXT); CREATE TABLE IF NOT EXISTS CLASS (ID INTEGER PRIMARY KEY AUTOINCREMENT, CID MEDIUMINT NOT NULL AUTO_INCREMENT, NAME TEXT, BEGIN DATE, END DATE); CREATE TABLE IF NOT EXISTS STUDENTCLASS (ID INTEGER PRIMARY KEY AUTOINCREMENT, SID MEDIUMINT, CID MEDIUMINT, PERIOD INTEGER); REATE TABLE IF NOT EXISTS BEHAVIOR (ID INTEGER PRIMARY KEY AUTOINCREMENT, BID MEDIUMINT NOT NULL AUTO_INCREMENT, NAME TEXT); CREATE TABLE IF NOT EXISTS STUDENTBEHAVIOR (ID INTEGER PRIMARY KEY AUTOINCREMENT, SID MEDIUMINT, CID MEDIUMINT, BID MEDIUMINT, STARS INTEGER, DATELOGGED DATETIME); CREATE TABLE IF NOT EXISTS COMMENTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, SID MEDIUMINT, PERIOD INTEGER, COMMENT TEXT, DATELOGGED DATETIME)"
                if !contactDB.executeStatements(sql_stmt) {
                    println("Error: \(contactDB.lastErrorMessage())")
                }
                contactDB.close()
            } else {
                println("Error: \(contactDB.lastErrorMessage())")
            }
        }
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveData(sender: AnyObject) {
        let contactDB = FMDatabase(path: databasePath as String)
        
        if contactDB.open() {
            
            let insertSQL = "INSERT INTO CONTACTS (name, address, phone) VALUES ('\(name.text)', '\(address.text)', '\(phone.text)')"
            
            let result = contactDB.executeUpdate(insertSQL,
                withArgumentsInArray: nil)
            
            if !result {
                status.text = "Failed to add contact"
                println("Error: \(contactDB.lastErrorMessage())")
            } else {
                status.text = "Contact Added"
                name.text = ""
                address.text = ""
                phone.text = ""
            }
        } else {
            println("Error: \(contactDB.lastErrorMessage())")
        }
    }
    
    @IBAction func findContact(sender: AnyObject) {
        let contactDB = FMDatabase(path: databasePath as String)
        
        if contactDB.open() {
            let querySQL = "SELECT address, phone FROM CONTACTS WHERE name = '\(name.text)'"
            
            let results:FMResultSet? = contactDB.executeQuery(querySQL,
                withArgumentsInArray: nil)
            
            if results?.next() == true {
                address.text = results?.stringForColumn("address")
                phone.text = results?.stringForColumn("phone")
                status.text = "Record Found"
            } else {
                status.text = "Record not found"
                address.text = ""
                phone.text = ""
            }
            contactDB.close()
        } else {
            println("Error: \(contactDB.lastErrorMessage())")
        }
    }
    


