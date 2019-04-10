//
//  ViewController.swift
//  XcodeWayApp
//
//  Created by Khoa Pham on 18.10.2017.
//  Copyright © 2017 Fantageek. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    let defaults = UserDefaults(suiteName: "T78DK947F2.group.com.onmyway133.XcodeWay")

    @IBOutlet weak var statusLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaults?.set("iTerm", forKey: "whichTerminal")
        defaults?.synchronize()
    }
    
    @IBAction func onButtonTouch(_ sender: NSButton) {
        NSWorkspace.shared.open(URL(string: "https://github.com/onmyway133/XcodeWay")!)
    }
    
    @IBAction func onCheckTouch(_ sender: NSButton) {
        let home = NSSearchPathForDirectoriesInDomains(.applicationScriptsDirectory, .userDomainMask, true).first!
        let path = home.appending(".XcodeWayExtensions/XcodeWayScript.scpt")
        let exists = FileManager.default.fileExists(atPath: path)
        statusLabel.stringValue = exists ? "Yes" : "No"
    }
}

