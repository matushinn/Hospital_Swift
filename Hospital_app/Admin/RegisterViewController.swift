//
//  RegisterViewController.swift
//  Hospital_app
//
//  Created by 大江祥太郎 on 2019/07/23.
//  Copyright © 2019 shotaro. All rights reserved.
//

import UIKit
import NCMB
import SVProgressHUD

class RegisterViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userIdTextField: UITextField!
    
    @IBOutlet weak var birthdayTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userIdTextField.delegate = self
        userNameTextField.delegate = self
        birthdayTextField.delegate = self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //改行が効くようになる
        textField.resignFirstResponder()
        return true
    }
    @IBAction func signUp(_ sender: Any) {
        
        if userNameTextField.text == "" || userIdTextField.text == "" || birthdayTextField.text == "" {
            SVProgressHUD.showSuccess(withStatus: "入力してください。")
            
            return
        }
        
        let query = NCMBQuery(className: "Users")
        
        query?.findObjectsInBackground({ (result, error) in
            if error != nil{
                SVProgressHUD.dismiss()
            }else{
                for userObject in result as! [NCMBObject]{
                    let userId = userObject.object(forKey: "userId") as! String
                    
                    if self.userIdTextField.text == userId{
                        SVProgressHUD.showInfo(withStatus: "同じIDが存在します。")
                        self.userNameTextField.text = ""
                        self.userIdTextField.text = ""
                        self.birthdayTextField.text = ""
                        return
                    }
                    
                }
                    let userObject = NCMBObject(className: "Users")
                    
                    userObject?.setObject(self.userNameTextField.text!, forKey: "userName")
                    userObject?.setObject(self.userIdTextField.text!, forKey: "userId")
                    userObject?.setObject(self.birthdayTextField.text!, forKey: "birthday")
                    userObject?.saveInBackground({ (error) in
                        if error != nil{
                            SVProgressHUD.dismiss()
                        }else{
                            SVProgressHUD.showSuccess(withStatus: "保存成功")
                            
                        }
                    })
                
            }
        })
        
        
        
        
        
        
        
        
        
    
    }

    

}
