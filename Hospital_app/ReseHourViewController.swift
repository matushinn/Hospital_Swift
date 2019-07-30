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
                            var i = 0
                            for i in 0...24{
                                if userObject.object(forKey: String(i)) != nil{
                                    switch i{
                                    case 0:
                                        self.hourLabels[0].setTitle("8:00~8:20 ✖️", for: .normal)
                                        self.hourLabels[0].isEnabled = false
                                    case 1:
                                        self.hourLabels[1].setTitle("8:20~8:40 ✖️", for: .normal)
                                        self.hourLabels[1].isEnabled = false
                                    case 2:
                                        self.hourLabels[2].setTitle("8:40~9:00 ✖️", for: .normal)
                                        self.hourLabels[2].isEnabled = false
                                    case 3:
                                        self.hourLabels[3].setTitle("9:00~9:20 ✖️", for: .normal)
                                        self.hourLabels[3].isEnabled = false
                                    case 4:
                                        self.hourLabels[4].setTitle("9:20~9:40 ✖️", for: .normal)
                                        self.hourLabels[4].isEnabled = false
                                    case 5:
                                        self.hourLabels[5].setTitle("9:40~10:00 ✖️", for: .normal)
                                        self.hourLabels[5].isEnabled = false
                                    case 6:
                                        self.hourLabels[6].setTitle("10:00~10:20 ✖️", for: .normal)
                                        self.hourLabels[6].isEnabled = false
                                    case 7:
                                        self.hourLabels[7].setTitle("10:20~10:40 ✖️", for: .normal)
                                        self.hourLabels[7].isEnabled = false
                                    case 8:
                                        self.hourLabels[8].setTitle("10:40~11:00 ✖️", for: .normal)
                                        self.hourLabels[8].isEnabled = false
                                    case 9:
                                        self.hourLabels[9].setTitle("11:00~11:20 ✖️", for: .normal)
                                        self.hourLabels[9].isEnabled = false
                                    case 10:
                                        self.hourLabels[10].setTitle("11:20~11:40 ✖️", for: .normal)
                                        self.hourLabels[10].isEnabled = false
                                    case 11:
                                        self.hourLabels[11].setTitle("11:40~12:00 ✖️", for: .normal)
                                        self.hourLabels[11].isEnabled = false
                                    case 12:
                                        self.hourLabels[12].setTitle("12:00~12:20 ✖️", for: .normal)
                                        self.hourLabels[12].isEnabled = false
                                    case 13:
                                        self.hourLabels[13].setTitle("12:20~12:40 ✖️", for: .normal)
                                        self.hourLabels[13].isEnabled = false
                                    case 14:
                                        self.hourLabels[14].setTitle("15:00~15:20 ✖️", for: .normal)
                                        self.hourLabels[14].isEnabled = false
                                    case 15:
                                        self.hourLabels[15].setTitle("15:20~15:40 ✖️", for: .normal)
                                        self.hourLabels[15].isEnabled = false
                                    case 16:
                                        self.hourLabels[16].setTitle("15:40~16:00 ✖️", for: .normal)
                                        self.hourLabels[16].isEnabled = false
                                    case 17:
                                        self.hourLabels[17].setTitle("16:00~16:20 ✖️", for: .normal)
                                        self.hourLabels[17].isEnabled = false
                                    case 18:
                                        self.hourLabels[18].setTitle("16:20~16:40 ✖️", for: .normal)
                                        self.hourLabels[18].isEnabled = false
                                    case 19:
                                        self.hourLabels[19].setTitle("16:40~17:00 ✖️", for: .normal)
                                        self.hourLabels[19].isEnabled = false
                                    case 20:
                                        self.hourLabels[20].setTitle("17:00~17:20 ✖️", for: .normal)
                                        self.hourLabels[20].isEnabled = false
                                    case 21:
                                        self.hourLabels[21].setTitle("17:20~17:40 ✖️", for: .normal)
                                        self.hourLabels[21].isEnabled = false
                                    case 22:
                                        self.hourLabels[22].setTitle("17:40~18:00 ✖️", for: .normal)
                                        self.hourLabels[22].isEnabled = false
                                    case 23:
                                        self.hourLabels[23].setTitle("18:00~18:20 ✖️", for: .normal)
                                        self.hourLabels[23].isEnabled = false
                                    case 24:
                                        self.hourLabels[24].setTitle("18:20~18:40 ✖️", for: .normal)
                                        self.hourLabels[24].isEnabled = false
                                   
                                    default:
                                        break
                                    }
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
                            var i = 0
                            for i in 0...24{
                                if userObject.object(forKey: String(i)) != nil{
                                    switch i{
                                    case 0:
                                        self.hourLabels[0].setTitle("8:00~8:20 ✖️", for: .normal)
                                        self.hourLabels[0].isEnabled = false
                                    case 1:
                                        self.hourLabels[1].setTitle("8:20~8:40 ✖️", for: .normal)
                                        self.hourLabels[1].isEnabled = false
                                    case 2:
                                        self.hourLabels[2].setTitle("8:40~9:00 ✖️", for: .normal)
                                        self.hourLabels[2].isEnabled = false
                                    case 3:
                                        self.hourLabels[3].setTitle("9:00~9:20 ✖️", for: .normal)
                                        self.hourLabels[3].isEnabled = false
                                    case 4:
                                        self.hourLabels[4].setTitle("9:20~9:40 ✖️", for: .normal)
                                        self.hourLabels[4].isEnabled = false
                                    case 5:
                                        self.hourLabels[5].setTitle("9:40~10:00 ✖️", for: .normal)
                                        self.hourLabels[5].isEnabled = false
                                    case 6:
                                        self.hourLabels[6].setTitle("10:00~10:20 ✖️", for: .normal)
                                        self.hourLabels[6].isEnabled = false
                                    case 7:
                                        self.hourLabels[7].setTitle("10:20~10:40 ✖️", for: .normal)
                                        self.hourLabels[7].isEnabled = false
                                    case 8:
                                        self.hourLabels[8].setTitle("10:40~11:00 ✖️", for: .normal)
                                        self.hourLabels[8].isEnabled = false
                                    case 9:
                                        self.hourLabels[9].setTitle("11:00~11:20 ✖️", for: .normal)
                                        self.hourLabels[9].isEnabled = false
                                    case 10:
                                        self.hourLabels[10].setTitle("11:20~11:40 ✖️", for: .normal)
                                        self.hourLabels[10].isEnabled = false
                                    case 11:
                                        self.hourLabels[11].setTitle("11:40~12:00 ✖️", for: .normal)
                                        self.hourLabels[11].isEnabled = false
                                    case 12:
                                        self.hourLabels[12].setTitle("12:00~12:20 ✖️", for: .normal)
                                        self.hourLabels[12].isEnabled = false
                                    case 13:
                                        self.hourLabels[13].setTitle("12:20~12:40 ✖️", for: .normal)
                                        self.hourLabels[13].isEnabled = false
                                    case 14:
                                        self.hourLabels[14].setTitle("15:00~15:20 ✖️", for: .normal)
                                        self.hourLabels[14].isEnabled = false
                                    case 15:
                                        self.hourLabels[15].setTitle("15:20~15:40 ✖️", for: .normal)
                                        self.hourLabels[15].isEnabled = false
                                    case 16:
                                        self.hourLabels[16].setTitle("15:40~16:00 ✖️", for: .normal)
                                        self.hourLabels[16].isEnabled = false
                                    case 17:
                                        self.hourLabels[17].setTitle("16:00~16:20 ✖️", for: .normal)
                                        self.hourLabels[17].isEnabled = false
                                    case 18:
                                        self.hourLabels[18].setTitle("16:20~16:40 ✖️", for: .normal)
                                        self.hourLabels[18].isEnabled = false
                                    case 19:
                                        self.hourLabels[19].setTitle("16:40~17:00 ✖️", for: .normal)
                                        self.hourLabels[19].isEnabled = false
                                    case 20:
                                        self.hourLabels[20].setTitle("17:00~17:20 ✖️", for: .normal)
                                        self.hourLabels[20].isEnabled = false
                                    case 21:
                                        self.hourLabels[21].setTitle("17:20~17:40 ✖️", for: .normal)
                                        self.hourLabels[21].isEnabled = false
                                    case 22:
                                        self.hourLabels[22].setTitle("17:40~18:00 ✖️", for: .normal)
                                        self.hourLabels[22].isEnabled = false
                                    case 23:
                                        self.hourLabels[23].setTitle("18:00~18:20 ✖️", for: .normal)
                                        self.hourLabels[23].isEnabled = false
                                    case 24:
                                        self.hourLabels[24].setTitle("18:20~18:40 ✖️", for: .normal)
                                        self.hourLabels[24].isEnabled = false
                                        
                                    default:
                                        break
                                    }
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
                                    switch i{
                                    case 0:
                                        self.hourLabels[0].setTitle("8:00~8:20 ✖️", for: .normal)
                                        self.hourLabels[0].isEnabled = false
                                    case 1:
                                        self.hourLabels[1].setTitle("8:20~8:40 ✖️", for: .normal)
                                        self.hourLabels[1].isEnabled = false
                                    case 2:
                                        self.hourLabels[2].setTitle("8:40~9:00 ✖️", for: .normal)
                                        self.hourLabels[2].isEnabled = false
                                    case 3:
                                        self.hourLabels[3].setTitle("9:00~9:20 ✖️", for: .normal)
                                        self.hourLabels[3].isEnabled = false
                                    case 4:
                                        self.hourLabels[4].setTitle("9:20~9:40 ✖️", for: .normal)
                                        self.hourLabels[4].isEnabled = false
                                    case 5:
                                        self.hourLabels[5].setTitle("9:40~10:00 ✖️", for: .normal)
                                        self.hourLabels[5].isEnabled = false
                                    case 6:
                                        self.hourLabels[6].setTitle("10:00~10:20 ✖️", for: .normal)
                                        self.hourLabels[6].isEnabled = false
                                    case 7:
                                        self.hourLabels[7].setTitle("10:20~10:40 ✖️", for: .normal)
                                        self.hourLabels[7].isEnabled = false
                                    case 8:
                                        self.hourLabels[8].setTitle("10:40~11:00 ✖️", for: .normal)
                                        self.hourLabels[8].isEnabled = false
                                    case 9:
                                        self.hourLabels[9].setTitle("11:00~11:20 ✖️", for: .normal)
                                        self.hourLabels[9].isEnabled = false
                                    case 10:
                                        self.hourLabels[10].setTitle("11:20~11:40 ✖️", for: .normal)
                                        self.hourLabels[10].isEnabled = false
                                    case 11:
                                        self.hourLabels[11].setTitle("11:40~12:00 ✖️", for: .normal)
                                        self.hourLabels[11].isEnabled = false
                                    case 12:
                                        self.hourLabels[12].setTitle("12:00~12:20 ✖️", for: .normal)
                                        self.hourLabels[12].isEnabled = false
                                    case 13:
                                        self.hourLabels[13].setTitle("12:20~12:40 ✖️", for: .normal)
                                        self.hourLabels[13].isEnabled = false
                                    case 14:
                                        self.hourLabels[14].setTitle("15:00~15:20 ✖️", for: .normal)
                                        self.hourLabels[14].isEnabled = false
                                    case 15:
                                        self.hourLabels[15].setTitle("15:20~15:40 ✖️", for: .normal)
                                        self.hourLabels[15].isEnabled = false
                                    case 16:
                                        self.hourLabels[16].setTitle("15:40~16:00 ✖️", for: .normal)
                                        self.hourLabels[16].isEnabled = false
                                    case 17:
                                        self.hourLabels[17].setTitle("16:00~16:20 ✖️", for: .normal)
                                        self.hourLabels[17].isEnabled = false
                                    case 18:
                                        self.hourLabels[18].setTitle("16:20~16:40 ✖️", for: .normal)
                                        self.hourLabels[18].isEnabled = false
                                    case 19:
                                        self.hourLabels[19].setTitle("16:40~17:00 ✖️", for: .normal)
                                        self.hourLabels[19].isEnabled = false
                                    case 20:
                                        self.hourLabels[20].setTitle("17:00~17:20 ✖️", for: .normal)
                                        self.hourLabels[20].isEnabled = false
                                    case 21:
                                        self.hourLabels[21].setTitle("17:20~17:40 ✖️", for: .normal)
                                        self.hourLabels[21].isEnabled = false
                                    case 22:
                                        self.hourLabels[22].setTitle("17:40~18:00 ✖️", for: .normal)
                                        self.hourLabels[22].isEnabled = false
                                    case 23:
                                        self.hourLabels[23].setTitle("18:00~18:20 ✖️", for: .normal)
                                        self.hourLabels[23].isEnabled = false
                                    case 24:
                                        self.hourLabels[24].setTitle("18:20~18:40 ✖️", for: .normal)
                                        self.hourLabels[24].isEnabled = false
                                        
                                    default:
                                        break
                                    }
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
        switch sender.tag {
        case 0:
            self.hour = "8:00~8:20"
        case 1:
            self.hour = "8:20~8:40"
        case 2:
            self.hour = "8:40~9:00"
        case 3:
            self.hour = "9:00~9:20"
        case 4:
            self.hour = "9:20~9:40"
        case 5:
            self.hour = "9:40~10:00"
        case 6:
            self.hour = "10:00~10:20"
        case 7:
            self.hour = "10:20~10:40"
        case 8:
            self.hour = "10:40~11:00"
        case 9:
            self.hour = "11:00~11:20"
        case 10:
            self.hour = "11:20~11:40"
        case 11:
            self.hour = "11:40~12:00"
        case 12:
            self.hour = "12:00~12:20"
        case 13:
            self.hour = "12:20~12:40"
        case 14:
            self.hour = "15:00~13:20"
        case 15:
            self.hour = "15:20~15:40"
        case 16:
            self.hour = "15:40~16:00"
        case 17:
            self.hour = "16:00~16:20"
        case 18:
            self.hour = "16:20~16:40"
        case 19:
            self.hour = "16:40~17:00"
        case 20:
            self.hour = "17:00~17:20"
        case 21:
            self.hour = "17:20~17:40"
        case 22:
            self.hour = "17:40~18:00"
        case 23:
            self.hour = "18:00~18:20"
        case 24:
            self.hour = "18:20~18:40"
        default:
            break
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




