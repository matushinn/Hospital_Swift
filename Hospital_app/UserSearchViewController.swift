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
    
    @IBOutlet weak var userIdTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userIdTextField.delegate = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let searchVC = segue.destination as! SearchResultViewController
            searchVC.userName = userName
            
        }
    }
    
    @IBAction func search(_ sender: Any) {
        let query = NCMBQuery(className: "Users")
        
        if userIdTextField.text == ""{
            SVProgressHUD.showSuccess(withStatus: "入力してください")
            return
        }
        
        query?.includeKey("userId")
        
        query?.findObjectsInBackground({ (result, error) in
            if error != nil{
                SVProgressHUD.dismiss()
            }else{
                for userObject in result as! [NCMBObject]{
                    self.userName = userObject.object(forKey: "userName") as! String
                    
                    if self.userIdTextField.text == self.userName{
                        self.performSegue(withIdentifier: "toDetail", sender: nil)
                    }else{
                        
                    }
                    
                }
            }
        })
        
        
        
    }
    
    

}
