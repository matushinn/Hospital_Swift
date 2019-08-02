//
//  CancelConfirmViewController.swift
//  Hospital_app
//
//  Created by 大江祥太郎 on 2019/07/30.
//  Copyright © 2019 shotaro. All rights reserved.
//
import UIKit
import NCMB
import SVProgressHUD

class CancelConfirmViewController: UIViewController {
    
    var user = ""
    var rese_flag = 0
    var day = ""
    var hour = ""
    var pt = ""
    var userName = ""
    var userNames = [String]()
    
    
    var hour_flag = "0"
    var moreHour_flag = "0"
    
    let Minutes20 = ["8:00~8:20","8:20~8:40","8:40~9:00","9:00~9:20","9:20~9:40","9:40~10:00","10:00~10:20","10:20~10:40","10:40~11:00","11:00~11:20","11:20~11:40","11:40~12:00","12:00~12:20","12:20~12:40","15:00~15:20","15:20~15:40","15:40~16:00","16:00~16:20","16:20~16:40","16:40~17:00","17:00~17:20","17:20~17:40","17:40~18:00","18:00~18:20","18:20~18:40"]
    
    let Minutes40 = ["8:00~8:40","8:40~9:20","9:20~10:00","10:00~10:40","10:40~11:20","11:20~12:00","12:00~12:40","15:00~15:40","15:40~16:20","16:20~17:00","17:00~17:40","17:40~18:20"]
    
    let ptCheck = ["PT1","PT2","PT3"]
    let ptClassName = ["pt1_yoyaku","pt2_yoyaku","pt3_yoyaku"]
    
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var ptLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var hourLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...24{
            if hour == self.Minutes20[i]{
                self.hour_flag = String(i)
            }
            
        }
        for i in 0...11{
            if hour == self.Minutes40[i]{
                self.hour_flag = String(i)
                self.moreHour_flag = String(i+1)
            }
        }
        
        
        
        ptLabel.text = pt
        dateLabel.text = day
        hourLabel.text = hour
        userLabel.text = self.userName+"さん"
        
        
    }
    
    @IBAction func toTop(_ sender: Any) {
        for i in 0...2 {
            if self.pt == self.ptCheck[i]{
                let query = NCMBQuery(className: self.ptClassName[i])
                query?.findObjectsInBackground({ (result, error) in
                    if error != nil{
                        
                    }else{
                        
                        for userObject in result as! [NCMBObject]{
                            let userDate = userObject.object(forKey: "date") as? String
                            
                            if self.day == userDate{
                                userObject.setObject("", forKey: self.hour_flag)
                                userObject.saveInBackground({ (error) in
                                    if error != nil{
                                        print(error)
                                    }else{
                                        print("Update Succeed")
                                    }
                                })
                                
                                
                            }
                            
                        }
                    }
                })
            }
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.4) {
            self.navigationController?.popToRootViewController(animated: true)
        }
        
        
    }
    
    
}
