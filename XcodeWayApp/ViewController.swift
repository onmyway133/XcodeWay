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
    @IBOutlet weak var terminalButton: NSButton!
    @IBOutlet weak var itermButton: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkInstallScript()
        checkTerminal()
    }
    
    @IBAction func onButtonTouch(_ sender: NSButton) {
        NSWorkspace.shared.open(URL(string: "https://github.com/onmyway133/XcodeWay")!)
    }
    
    @IBAction func onCheckTouch(_ sender: NSButton) {
        checkInstallScript()
    }
    
    func checkInstallScript() {
        let home = NSSearchPathForDirectoriesInDomains(.applicationScriptsDirectory, .userDomainMask, true).first!
        let path = home.appending(".XcodeWayExtensions/XcodeWayScript.scpt")
        let exists = FileManager.default.fileExists(atPath: path)
        statusLabel.stringValue = exists ? "Yes" : "No"
    }
    
    func checkTerminal() {
        let terminal = defaults?.string(forKey: "whichTerminal") ?? "Terminal"
        
        switch terminal {
        case "iTerm":
            itermButton.state = .on
        default:
            terminalButton.state = .on
        }
    }
    
    @IBAction func onRadioTouch(_ sender: NSButton) {
        switch sender.tag {
        case 0:
            defaults?.set("Terminal", forKey: "whichTerminal")
            defaults?.synchronize()
        case 1:
            defaults?.set("iTerm", forKey: "whichTerminal")
            defaults?.synchronize()
        default:
            break
        }
    }
}

