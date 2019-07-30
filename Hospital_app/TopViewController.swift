//
//  TopViewController.swift
//  Hospital_app
//
//  Created by 大江祥太郎 on 2019/07/23.
//  Copyright © 2019 shotaro. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func yoyaku(_ sender: Any) {
        self.performSegue(withIdentifier: "toReserve", sender: nil)
    }
    @IBAction func cancel(_ sender: Any) {
        self.performSegue(withIdentifier: "toCancel", sender: nil)
    }
    @IBAction func admin(_ sender: Any) {
        self.performSegue(withIdentifier: "toAdmin", sender: nil)
    }
    
    
}
