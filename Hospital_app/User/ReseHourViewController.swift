//
//  ReseHourViewController.swift
//  Hospital_app
//
//  Created by 大江祥太郎 on 2019/07/23.
//  Copyright © 2019 shotaro. All rights reserved.
//

import UIKit
import NCMB
import SVProgressHUD

class ReseHourViewController: UIViewController {
    
    var user = ""
    var rese_flag = 1
    var day = ""
    var hour = ""
    var pt = "PT1"
    
    var row_check = 0
    
    @IBOutlet var hourLabels: [UIButton]!
    
    
    
    
    let Minutes20 = ["8:00~8:20","8:20~8:40","8:40~9:00","9:00~9:20","9:20~9:40","9:40~10:00","10:00~10:20","10:20~10:40","10:40~11:00","11:00~11:20","11:20~11:40","11:40~12:00","12:00~12:20","12:20~12:40","15:00~15:20","15:20~15:40","15:40~16:00","16:00~16:20","16:20~16:40","16:40~17:00","17:00~17:20","17:20~17:40","17:40~18:00","18:00~18:20","18:20~18:40"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func viewWillAppear(_ animated: Bool) {
        switch self.pt {
        case "PT1":
            let pt1_query = NCMBQuery(className: "pt1_yoyaku")
            
            pt1_query?.findObjectsInBackground({ (result, error) in
                if error != nil{
                    
                }else{
                    for userObject in result as! [NCMBObject]{
                        let userDate = userObject.object(forKey: "date") as? String
                        
                        if self.day == userDate{
                            for i in 0...24{
                                if userObject.object(forKey: String(i)) != nil{
                                    self.hourLabels[i].setTitle(self.Minutes20[0]+"✖️", for: .normal)
                                    self.hourLabels[i].isEnabled = false
                                    
                                }
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
                            for i in 0...24{
                                if userObject.object(forKey: String(i)) != nil{
                                    self.hourLabels[i].setTitle(self.Minutes20[i]+"✖️", for: .normal)
                                    self.hourLabels[i].isEnabled = false
                                    
                                }
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
                            var i = 0
                            for i in 0...24{
                                if userObject.object(forKey: String(i)) != nil{
                                    self.hourLabels[i].setTitle(self.Minutes20[i]+"✖️", for: .normal)
                                    self.hourLabels[i].isEnabled = false
                                }
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
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toConfirm"{
            let reseConfirmVC = segue.destination as! ReseConfirmViewController
            reseConfirmVC.user = user
            reseConfirmVC.rese_flag = rese_flag
            reseConfirmVC.day = day
            reseConfirmVC.hour = hour
            reseConfirmVC.pt = pt
        }else if segue.identifier == "to40m"{
            let reseConfirmVC = segue.destination as! AddReseHourViewController
            reseConfirmVC.user = user
            reseConfirmVC.rese_flag = rese_flag
            reseConfirmVC.day = day
        }
    }
    
    @IBAction func hourButtons(_ sender: UIButton) {
        for i in 0...24{
            if sender.tag == i{
                self.hour = Minutes20[i]
            }
        }
        self.performSegue(withIdentifier: "toConfirm", sender: nil)
    }
    
    @IBAction func change(_ sender: UISegmentedControl) {
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
    @IBAction func to40m(_ sender: Any) {
        self.performSegue(withIdentifier: "to40m", sender: nil)
    }
    
}




