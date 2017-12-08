//
//  ViewController.swift
//  DebugMode
//
//  Created by PASQUIER Esteban on 12/08/2017.
//  Copyright (c) 2017 PASQUIER Esteban. All rights reserved.
//

import UIKit
import DebugMode

class ViewController: UIViewController, DebugModeReactive {
    
    private var _prefersStatusBarHidden : Bool? = nil
    
    override var prefersStatusBarHidden: Bool {
        if let _prefersStatusBarHidden = _prefersStatusBarHidden {
            return _prefersStatusBarHidden
        }
        return super.prefersStatusBarHidden
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.subscribeToDebugModeChanged()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    deinit {
        self.unsubsribeToDebugModeChanged()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didChangeDebugMode(_ debugModeEnable: Bool) {
        _prefersStatusBarHidden = debugModeEnable
        self.setNeedsStatusBarAppearanceUpdate()
    }
}

