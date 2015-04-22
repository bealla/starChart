//
//  ViewController.swift
//  starChart
//
//  Created by Alexandra Beall on 4/17/15.
//  Copyright (c) 2015 Alexandra Beall. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate{
    
    //let barColor = UIColor(red:70, green:24,blue:76,alpha:1.0)
    
    //@IBOutlet weak var starchart: UIImageView!
    //starchart.backgroundColor = UIColor.redColor()
    
    let imageView = UIImageView(frame: CGRectMake(0, 0, 100, 100))
    //self.imageView.backgroundColor = UIColor.redColor()
    var databasePath = NSString()
    
   /* //function to fill up star tail as more stars are added, do an if statement setting each color chunk to its color if x amonut of stars have been collected, SQL
    func fillTail(){
        
    }
    
    
    //set text to whichever student's being view name, SQL
    @IBAction func viewStudents(sender: AnyObject) {
        
        
    }
    
    @IBAction func hamburgerButton(sender: AnyObject) {
         //popover taking you to edit/add student or add class, no other functionality 
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*let filemgr = NSFileManager.defaultManager()
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
                let sql_stmt = "CREATE TABLE IF NOT EXISTS STUDENT (ID INTEGER PRIMARY KEY AUTOINCREMENT, SID MEDIUMINT NOT NULL AUTO_INCREMENT, NAME TEXT); CREATE TABLE IF NOT EXISTS CLASS (ID INTEGER PRIMARY KEY AUTOINCREMENT, CID MEDIUMINT NOT NULL AUTO_INCREMENT, NAME TEXT, BEGIN DATE, END DATE); CREATE TABLE IF NOT EXISTS STUDENTCLASS (ID INTEGER PRIMARY KEY AUTOINCREMENT, SID MEDIUMINT, CID MEDIUMINT, PERIOD INTEGER); CREATE TABLE IF NOT EXISTS BEHAVIOR (ID INTEGER PRIMARY KEY AUTOINCREMENT, BID MEDIUMINT NOT NULL AUTO_INCREMENT, NAME TEXT); CREATE TABLE IF NOT EXISTS STUDENTBEHAVIOR (ID INTEGER PRIMARY KEY AUTOINCREMENT, SID MEDIUMINT, CID MEDIUMINT, BID MEDIUMINT, STARS INTEGER, DATELOGGED DATETIME); CREATE TABLE IF NOT EXISTS COMMENTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, SID MEDIUMINT, PERIOD INTEGER, COMMENT TEXT, DATELOGGED DATETIME)"
                if !contactDB.executeStatements(sql_stmt) {
                    println("Error: \(contactDB.lastErrorMessage())")
                }
                contactDB.close()
            } else {
                println("Error: \(contactDB.lastErrorMessage())")
            }
        }*/
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController!, traitCollection: UITraitCollection!) -> UIModalPresentationStyle {
        return .None
    }


}

