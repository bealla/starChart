//
//  ViewController.swift
//  starChart
//
//  Created by Alexandra Beall on 4/17/15.
//  Copyright (c) 2015 Alexandra Beall. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate{
    
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var titlebar: UIImageView!
    
    @IBOutlet weak var studentname: UIImageView!
    
    @IBOutlet weak var classes: UIImageView!
    
    
    @IBOutlet weak var starbarContainer: UIImageView!
    
    
    @IBOutlet weak var behavior1Label: UILabel!
    
    
    @IBOutlet weak var behavior2Label: UILabel!
    
    @IBOutlet weak var behavior3Label: UILabel!
    
    @IBOutlet weak var appTitle: UILabel!
    
    //star coin images for each behavior
    @IBOutlet weak var b1s1: UIImageView!
    @IBOutlet weak var b1s2: UIImageView!
    @IBOutlet weak var b1s3: UIImageView!
    
    @IBOutlet weak var b2s1: UIImageView!
    @IBOutlet weak var b2s2: UIImageView!
    @IBOutlet weak var b2s3: UIImageView!
    
    @IBOutlet weak var b3s1: UIImageView!
    @IBOutlet weak var b3s2: UIImageView!
    @IBOutlet weak var b3s3: UIImageView!
    
    //parts of rainbow star
    
    @IBOutlet weak var redChunk: UIImageView!
    @IBOutlet weak var yellowChunk: UIImageView!
    @IBOutlet weak var greenChunk: UIImageView!
    @IBOutlet weak var rainbowChunk: UIImageView!
    
    //behavoir one stars buttons
    @IBAction func b1s1button(sender: AnyObject) {
        b1s1.image = UIImage(named: ("starclicked.png"))
        b1s2.image = UIImage(named: ("unclickedStar.png"))
        b1s3.image = UIImage(named: ("unclickedStar.png"))
    }
    
    
    @IBAction func b1s2Button(sender: AnyObject) {
        b1s1.image = UIImage(named: ("starclicked.png"))
        b1s2.image = UIImage(named: ("starclicked.png"))
        b1s3.image = UIImage(named: ("unclickedStar.png"))
    }
    
    @IBAction func b1s3(sender: AnyObject) {
        b1s1.image = UIImage(named: ("starclicked.png"))
        b1s2.image = UIImage(named: ("starclicked.png"))
        b1s3.image = UIImage(named: ("starclicked.png"))
    }
    
    //behavior two star buttons
    
    @IBAction func b2s1button(sender: AnyObject) {
        b2s1.image = UIImage(named: ("starclicked.png"))
        b2s2.image = UIImage(named: ("unclickedStar.png"))
        b2s3.image = UIImage(named: ("unclickedStar.png"))
    }
    
    @IBAction func b2s2Button(sender: AnyObject) {
        b2s1.image = UIImage(named: ("starclicked.png"))
        b2s2.image = UIImage(named: ("starclicked.png"))
        b2s3.image = UIImage(named: ("unclickedStar.png"))
    }
    
    
    @IBAction func b2s3Button(sender: AnyObject) {
        b2s1.image = UIImage(named: ("starclicked.png"))
        b2s2.image = UIImage(named: ("starclicked.png"))
        b2s3.image = UIImage(named: ("starclicked.png"))
    }
    
    //behavior three star buttons
    
    @IBAction func b3s1(sender: AnyObject) {
        b3s1.image = UIImage(named: ("starclicked.png"))
        b3s2.image = UIImage(named: ("unclickedStar.png"))
        b3s3.image = UIImage(named: ("unclickedStar.png"))
    }
    
    @IBAction func b3s2(sender: AnyObject) {
        b3s1.image = UIImage(named: ("starclicked.png"))
        b3s2.image = UIImage(named: ("starclicked.png"))
        b3s3.image = UIImage(named: ("unclickedStar.png"))
    }
    @IBAction func b3s3(sender: AnyObject) {
        b3s1.image = UIImage(named: ("starclicked.png"))
        b3s2.image = UIImage(named: ("starclicked.png"))
        b3s3.image = UIImage(named: ("starclicked.png"))
    }

    var databasePath = NSString()
    
    //function to fill up star tail as more stars are added, do an if statement setting each color chunk to its color if x amonut of stars have been collected, SQL
    func fillTail(){
        
    }
    
    
    //set text to whichever student's being view name, SQL
    @IBAction func viewStudents(sender: AnyObject) {
        
        
    }
    
    @IBAction func hamburgerButton(sender: AnyObject) {
         //popover taking you to edit/add student or add class, no other functionality 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController!, traitCollection: UITraitCollection!) -> UIModalPresentationStyle {
        return .None
    }


}

