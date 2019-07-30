//
//  CancelLoginViewController.swift
//  Hospital_app
//
//  Created by 大江祥太郎 on 2019/07/30.
//  Copyright © 2019 shotaro. All rights reserved.
//

import NCMB
import SVProgressHUD

class CancelLoginViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var userIdTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userIdTextField.delegate = self
    }
    //エンターキーで返す
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCancelConfirm" {
            let user = userIdTextField.text!
            let cancelVC = segue.destination as! CancelConfirmViewController
            cancelVC.user = user
            
        }
        
    }
    
    @IBAction func Login(_ sender: Any) {
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
                    let userId = userObject.object(forKey: "userId") as! String
                    
                    if self.userIdTextField.text == userId{
                        self.performSegue(withIdentifier: "toCancelConfirm", sender: nil)
                    }else{
                        
                    }
                    
                }
            }
        })
        
    }

    
    
}

