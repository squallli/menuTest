//
//  ViewController.swift
//  MenuTest
//
//  Created by 宗桓 李 on 2016/10/3.
//  Copyright © 2016年 squall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    
    let settingsLauncher = settingView()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showMenu(_ sender: AnyObject) {
        settingsLauncher.showSettings()
    }
    
        
    
}

