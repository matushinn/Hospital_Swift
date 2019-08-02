//
//  AdminLoginViewController.swift
//  Hospital_app
//
//  Created by 大江祥太郎 on 2019/08/02.
//  Copyright © 2019 shotaro. All rights reserved.
//

import UIKit
import SVProgressHUD

class AdminLoginViewController: UIViewController {
    
    
    @IBOutlet weak var userIdTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: Any) {
        if userIdTextField.text == "taro" && passwordTextField.text == "1234" {
            self.performSegue(withIdentifier: "toAdTop", sender: nil)
        }
    }
    
   

}
