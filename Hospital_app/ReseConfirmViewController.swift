//
//  ReseConfirmViewController.swift
//  Hospital_app
//
//  Created by 大江祥太郎 on 2019/07/30.
//  Copyright © 2019 shotaro. All rights reserved.
//

import UIKit
import NCMB
import SVProgressHUD

class ReseConfirmViewController: UIViewController {
    
    var user = ""
    var rese_flag = 0
    var day = ""
    var hour = ""
    var pt = ""
    var userName = ""
    
    var hour_flag = "0"
    var moreHour_flag = "0"
    
    
    
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var ptLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var hourLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch hour {
        case "8:00~8:20":
            self.hour_flag = "0"
        case "8:20~8:40":
            self.hour_flag = "1"
        case "8:40~9:00":
            self.hour_flag = "2"
        case "9:00~9:20":
            self.hour_flag = "3"
        case "9:20~9:40":
            self.hour_flag = "4"
        case "9:40~10:00":
            self.hour_flag = "5"
        case "10:00~10:20":
            self.hour_flag = "6"
        case "10:20~10:40":
            self.hour_flag = "7"
        case "10:40~11:00":
            self.hour_flag = "8"
        case "11:00~11:20":
            self.hour_flag = "9"
        case "11:20~11:40":
            self.hour_flag = "10"
        case "11:40~12:00":
            self.hour_flag = "11"
        case "12:00~12:20":
            self.hour_flag = "12"
        case "12:20~12:40":
            self.hour_flag = "13"
        case "15:00~15:20":
            self.hour_flag = "14"
        case "15:20~15:40":
            self.hour_flag = "15"
        case "15:40~16:00":
            self.hour_flag = "16"
        case "16:00~16:20":
            self.hour_flag = "17"
        case "16:20~16:40":
            self.hour_flag = "18"
        case "16:40~17:00":
            self.hour_flag = "19"
        case "17:00~17:20":
            self.hour_flag = "20"
        case "17:20~17:40":
            self.hour_flag = "21"
        case "17:40~18:00":
            self.hour_flag = "22"
        case "18:00~18:20":
            self.hour_flag = "23"
        case "18:20~18:40":
            self.hour_flag = "24"
        case "8:00~8:40":
            self.hour_flag = "0"
            self.moreHour_flag = "1"
        case "8:40~9:20":
            self.hour_flag = "2"
            self.moreHour_flag = "3"
        case "9:20~10:00":
            self.hour_flag = "4"
            self.moreHour_flag = "5"
        case "10:00~10:40":
            self.hour_flag = "6"
            self.moreHour_flag = "7"
        case "10:40~11:20":
            self.hour_flag = "8"
            self.moreHour_flag = "9"
        case "11:20~12:00":
            self.hour_flag = "10"
            self.moreHour_flag = "11"
        case "12:00~12:40":
            self.hour_flag = "12"
            self.moreHour_flag = "13"
        case "15:00~15:40":
            self.hour_flag = "14"
            self.moreHour_flag = "15"
        
        case "15:40~16:20":
            self.hour_flag = "16"
            self.moreHour_flag = "17"
        case "16:20~17:00":
            self.hour_flag = "18"
            self.moreHour_flag = "19"
        
        case "17:00~17:40":
            self.hour_flag = "20"
            self.moreHour_flag = "21"
        case "17:40~18:20":
            self.hour_flag = "22"
            self.moreHour_flag = "23"
        
        default:
            break
        }
        
        let query = NCMBQuery(className: "Users")
        
        query?.findObjectsInBackground({ (result, error) in
            if error != nil{
                SVProgressHUD.dismiss()
            }else{
                for userObject in result as! [NCMBObject]{
                    let userId = userObject.object(forKey: "userId") as! String
                    
                    if self.user == userId{
                        self.userName = userObject.object(forKey: "userName") as! String
                        self.userLabel.text = self.userName
                        
                        switch self.rese_flag{
                        case 1:
                            userObject.setObject(self.day, forKey: "FirstReseDay")
                            userObject.setObject(self.day+self.hour, forKey: "FirstReseDate")
                            userObject.setObject(self.pt, forKey: "FirstPT")
                            userObject.setObject(self.hour_flag, forKey: "FirstHourFlag")
                        case 2:
                            userObject.setObject(self.day, forKey: "SecondReseDay")
                            userObject.setObject(self.day+self.hour, forKey: "SecondReseDate")
                            userObject.setObject(self.pt, forKey: "SecondPT")
                            userObject.setObject(self.hour_flag, forKey: "SecondHourFlag")
                        case 3:
                            userObject.setObject(self.day, forKey: "ThirdReseDay")
                            userObject.setObject(self.day+self.hour, forKey: "ThirdReseDate")
                            userObject.setObject(self.pt, forKey: "ThirdPT")
                            userObject.setObject(self.hour_flag, forKey: "ThirdHourFlag")
                        case 4:
                            userObject.setObject(self.day, forKey: "FourthReseDay")
                            userObject.setObject(self.day+self.hour, forKey: "FourthReseDate")
                            userObject.setObject(self.pt, forKey: "FourthPT")
                            userObject.setObject(self.hour_flag, forKey: "FourthHourFlag")
                        case 5:
                            userObject.setObject(self.day, forKey: "FifthReseDay")
                            userObject.setObject(self.day+self.hour, forKey: "FifthReseDate")
                            userObject.setObject(self.pt, forKey: "FifthPT")
                            userObject.setObject(self.hour_flag, forKey: "FifthHourFlag")
                        default:
                            break
                        }
                        print(self.rese_flag)
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
        
        
        ptLabel.text = pt
        dateLabel.text = day
        hourLabel.text = hour

        
    }
    
    @IBAction func toTop(_ sender: Any) {
        switch pt {
        case "PT1":
            let pt1_query = NCMBQuery(className: "pt1_yoyaku")
            
            pt1_query?.findObjectsInBackground({ (result, error) in
                if error != nil{
                    
                }else{
                    for userObject in result as! [NCMBObject]{
                        let userDate = userObject.object(forKey: "date") as? String
                        
                        if self.day == userDate{
                            userObject.setObject(self.userLabel.text!, forKey: self.hour_flag)
                            
                            if self.moreHour_flag != ""{
                                userObject.setObject(self.userLabel.text!, forKey: self.moreHour_flag)
                            }
                            
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
        case "PT2":
            let pt2_query = NCMBQuery(className: "pt2_yoyaku")
            
            pt2_query?.findObjectsInBackground({ (result, error) in
                if error != nil{
                    
                }else{
                    for userObject in result as! [NCMBObject]{
                        let userDate = userObject.object(forKey: "date") as? String
                        
                        if self.day == userDate{
                            userObject.setObject(self.userLabel.text!, forKey: self.hour_flag)
                            if self.moreHour_flag != ""{
                                userObject.setObject(self.userLabel.text!, forKey: self.moreHour_flag)
                            }
                            
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
        case "PT3":
            let pt3_query = NCMBQuery(className: "pt3_yoyaku")
            
            pt3_query?.findObjectsInBackground({ (result, error) in
                if error != nil{
                    
                }else{
                    for userObject in result as! [NCMBObject]{
                        let userDate = userObject.object(forKey: "date") as? String
                        
                        if self.day == userDate{
                            userObject.setObject(self.userLabel.text!, forKey: self.hour_flag)
                            if self.moreHour_flag != ""{
                                userObject.setObject(self.userLabel.text!, forKey: self.moreHour_flag)
                            }
                            
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
        default:
            break
        }
        
        self.performSegue(withIdentifier: "toTop", sender: nil)
    }
    
    
}
