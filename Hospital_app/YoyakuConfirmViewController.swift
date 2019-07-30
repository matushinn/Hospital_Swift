//
//  YoyakuConfirmViewController.swift
//  Hospital_app
//
//  Created by 大江祥太郎 on 2019/07/31.
//  Copyright © 2019 shotaro. All rights reserved.
//

import UIKit
import NCMB
import SVProgressHUD

class YoyakuConfirmViewController: UIViewController {
    
    var pt = "PT1"
    var user = ""
    var rese_flag = 1
    var day = ""
    var hour = ""
    
    let Minutes20 = ["8:00~8:20","8:20~8:40","8:40~9:00","9:00~9:20","9:20~9:40","9:40~10:00","10:00~10:20","10:20~10:40","10:40~11:00","11:00~11:20","11:20~11:40","11:40~12:00","12:00~12:20","12:20~12:40","15:00~15:20","15:20~15:40","15:40~16:00","16:00~16:20","16:20~16:40","16:40~17:00","17:00~17:20","17:20~17:40","17:40~18:00","18:00~18:20","18:20~18:40"]
    
    @IBOutlet var hourLabels: [UILabel]!
    
    @IBOutlet var checkLabels: [UILabel]!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        switch pt {
        case "PT1":
            let pt1_query = NCMBQuery(className: "pt1_yoyaku")
            
            pt1_query?.findObjectsInBackground({ (result, error) in
                if error != nil{
                    
                }else{
                    for userObject in result as! [NCMBObject]{
                        let userDate = userObject.object(forKey: "date") as? String
                        
                        if self.day == userDate{
                            for i in 0...24{
                                if userObject.object(forKey:  String(i)) != nil{
                                    let check = userObject.object(forKey: String(i)) as! String
                                    self.hourLabels[i].text = self.Minutes20[i]
                                    self.checkLabels[i].text = check
                                    
                                }
                            }
                        }
                    }
                }
            })
            
        case "PT2":
            let pt2_query = NCMBQuery(className: "pt2_yoyaku")
            
            pt2_query?.findObjectsInBackground({ (result, error) in
                if error != nil{
                    
                }else{
                    for userObject in result as! [NCMBObject]{
                        let userDate = userObject.object(forKey: "date") as? String
                        
                        if self.day == userDate{
                            for i in 0...24{
                                if userObject.object(forKey:  String(i)) != nil{
                                    let check = userObject.object(forKey: String(i)) as! String
                                    self.hourLabels[i].text = self.Minutes20[i]
                                    self.checkLabels[i].text = check
                                    
                                }
                            }
                        }
                    }
                }
            })
        case "PT3":
            let pt3_query = NCMBQuery(className: "pt3_yoyaku")
            
            pt3_query?.findObjectsInBackground({ (result, error) in
                if error != nil{
                    
                }else{
                    for userObject in result as! [NCMBObject]{
                        let userDate = userObject.object(forKey: "date") as? String
                        
                        if self.day == userDate{
                            for i in 0...24{
                                if userObject.object(forKey:  String(i)) != nil{
                                    let check = userObject.object(forKey: String(i)) as! String
                                    self.hourLabels[i].text = self.Minutes20[i]
                                    self.checkLabels[i].text = check
                                    
                                }
                            }
                        }
                    }
                }
            })
        default:
            break
        }
    }
    
    @IBAction func check(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.pt = "PT1"
        case 1:
            self.pt = "PT2"
        case 2:
            self.pt = "PT3"
        default:
            break
        }
    }
    
    

}
