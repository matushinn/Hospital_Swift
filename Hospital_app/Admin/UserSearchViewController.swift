//
//  UserSearchViewController.swift
//  Hospital_app
//
//  Created by 大江祥太郎 on 2019/07/25.
//  Copyright © 2019 shotaro. All rights reserved.
//

import UIKit
import NCMB
import SVProgressHUD

class UserSearchViewController: UIViewController,UITextFieldDelegate {

    var userName = ""
    var userBirth = ""
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var birthTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userNameTextField.delegate = self
        birthTextField.delegate = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let searchVC = segue.destination as! SearchResultViewController
            searchVC.userName = userName
            searchVC.userBirth = userBirth
        }
    }
    
    @IBAction func search(_ sender: Any) {
        let query = NCMBQuery(className: "Users")
        
        if userNameTextField.text == "" || birthTextField.text == ""{
            SVProgressHUD.showSuccess(withStatus: "入力してください")
            return
        }
        
        
        query?.findObjectsInBackground({ (result, error) in
            if error != nil{
                SVProgressHUD.dismiss()
            }else{
                for userObject in result as! [NCMBObject]{
                    self.userName = userObject.object(forKey: "userName") as! String
                    self.userBirth = userObject.object(forKey: "birthday") as! String
                    
                    if self.userNameTextField.text == self.userName && self.birthTextField.text == self.userBirth{
                        self.performSegue(withIdentifier: "toDetail", sender: nil)
                    }
                    
                }
            }
        })
        
        
        
    }
    
    

}
