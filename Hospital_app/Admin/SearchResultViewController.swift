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
    
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        userNameLabel.text = userName
        let query = NCMBQuery(className: "Users")
        
        query?.findObjectsInBackground({ (result, error) in
            if error != nil{
                SVProgressHUD.dismiss()
            }else{
                for userObject in result as! [NCMBObject]{
                    let userName = userObject.object(forKey: "userName") as! String
                    
                    if self.userName == userName{
                        self.userIdLabel.text = userObject.object(forKey: "userId") as! String
                    }
                }
            }
        })
        
        
    }
    
    

    

}
