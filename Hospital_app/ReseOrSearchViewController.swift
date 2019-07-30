//
//  ReseOrSearchViewController.swift
//  Hospital_app
//
//  Created by 大江祥太郎 on 2019/07/25.
//  Copyright © 2019 shotaro. All rights reserved.
//

import UIKit

class ReseOrSearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func rese(_ sender: Any) {
        self.performSegue(withIdentifier: "toCalendar", sender: nil)
    }
    
    @IBAction func addOrSearch(_ sender: Any) {
        self.performSegue(withIdentifier: "toAddOrSearch", sender: nil)
    }
    

}
