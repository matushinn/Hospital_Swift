//
//  SearchResultViewController.swift
//  Hospital_app
//
//  Created by 大江祥太郎 on 2019/07/31.
//  Copyright © 2019 shotaro. All rights reserved.
//

import UIKit
import NCMB
import SVProgressHUD

class SearchResultViewController: UIViewController {

    var userName = ""
    var userBirth = ""
    
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad() 
    }
    override func viewWillAppear(_ animated: Bool) {
        userNameLabel.text = "お名前 : "+userName+" さん"
        let query = NCMBQuery(className: "Users")
        
        query?.findObjectsInBackground({ (result, error) in
            if error != nil{
                SVProgressHUD.dismiss()
            }else{
                for userObject in result as! [NCMBObject]{
                    let userName = userObject.object(forKey: "userName") as! String
                    let userBirth = userObject.object(forKey: "birthday") as! String
                    
                    
                    
                    if self.userName == userName && self.userBirth == userBirth{
                        self.userIdLabel.text =  userObject.object(forKey: "userId") as! String
                    }
                }
            }
        })
    }
    @IBAction func toTop(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    

    

}
