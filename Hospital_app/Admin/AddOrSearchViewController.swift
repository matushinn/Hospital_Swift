//
//  AddOrSearchViewController.swift
//  Hospital_app
//
//  Created by 大江祥太郎 on 2019/07/25.
//  Copyright © 2019 shotaro. All rights reserved.
//

import UIKit

class AddOrSearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func add(_ sender: Any) {
        self.performSegue(withIdentifier: "toAdd", sender: nil)
    }
    
    @IBAction func search(_ sender: Any) {
        self.performSegue(withIdentifier: "toSearch", sender: nil)
    }
    
    @IBAction func toTop(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
}
