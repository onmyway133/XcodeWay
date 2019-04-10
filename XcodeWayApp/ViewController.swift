//
//  ViewController.swift
//  XcodeWayApp
//
//  Created by Khoa Pham on 18.10.2017.
//  Copyright © 2017 Fantageek. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    @IBAction func onButtonTouch(_ sender: NSButton) {
        NSWorkspace.shared.open(URL(string: "https://github.com/onmyway133/XcodeWay")!)
    }
}

