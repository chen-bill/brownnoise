//
//  StatusItemViewController.swift
//  brownNoise
//
//  Created by Bill Chen on 2017-11-30.
//  Copyright © 2017 Bill Chen. All rights reserved.
//

import Cocoa

class StatusItemViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    class func loadFromNib() -> StatusItemViewController {
        let vc = NSStoryboard(name: NSStoryboard.Name(rawValue: "StatusItemViewController"), bundle: nil).instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "Main")) as! StatusItemViewController
        return vc
    }
}
