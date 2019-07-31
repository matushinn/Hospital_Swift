//
//  SignInViewController.swift
//  Hospital_app
//
//  Created by 大江祥太郎 on 2019/07/29.
//  Copyright © 2019 shotaro. All rights reserved.
//

import UIKit
import NCMB
import SVProgressHUD


class SignInViewController: UIViewController ,UITextFieldDelegate{

    
    @IBOutlet weak var adminIdTextField:UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        adminIdTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func login(_ sender: Any) {
        if adminIdTextField.text != "" || passwordTextField.text != "" {
            
            NCMBUser.logInWithUsername(inBackground: adminIdTextField.text!, password: passwordTextField.text!) { (user, error) in
                if error != nil {
                    SVProgressHUD.showError(withStatus: error!.localizedDescription)
                } else {
                    
                        // ログイン成功
                        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                        let rootViewController = storyboard.instantiateViewController(withIdentifier: "RootMainController")
                        UIApplication.shared.keyWindow?.rootViewController = rootViewController
                        
                    
                    }
                }
            }
        }
    
    

   
}
