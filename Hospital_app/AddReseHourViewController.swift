//
//  AddReseHourViewController.swift
//  Hospital_app
//
//  Created by 大江祥太郎 on 2019/07/30.
//  Copyright © 2019 shotaro. All rights reserved.
//

import UIKit
import NCMB
import SVProgressHUD

class AddReseHourViewController: UIViewController{
    
    var user = ""
    var rese_flag = 0
    var day = ""
    var hour = ""
    var pt = ""

    @IBOutlet var hourLabels: [UIButton]!
    
    let Minutes40 = ["8:00~8:40","8:40~9:20","9:20~10:00","10:00~10:40","10:40~11:20","11:20~12:00","12:00~12:40","15:00~15:40","15:40~16:20","16:20~17:00","17:00~17:40","17:40~18:20"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
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
                                    case 0,1:
                                        self.hourLabels[0].setTitle("8:00~8:40 ✖️", for: .normal)
                                        self.hourLabels[0].isEnabled = false
                                    case 2,3:
                                        self.hourLabels[1].setTitle("8:40~9:20 ✖️", for: .normal)
                                        self.hourLabels[1].isEnabled = false
                                    case 4,5:
                                        self.hourLabels[2].setTitle("9:20~10:00 ✖️", for: .normal)
                                        self.hourLabels[2].isEnabled = false
                                    case 6,7:
                                        self.hourLabels[3].setTitle("10:00~10:40 ✖️", for: .normal)
                                        self.hourLabels[3].isEnabled = false
                                    case 8,9:
                                        self.hourLabels[4].setTitle("10:40~11:20 ✖️", for: .normal)
                                        self.hourLabels[4].isEnabled = false
                                    case 10,11:
                                        self.hourLabels[5].setTitle("11:20~12:00 ✖️", for: .normal)
                                        self.hourLabels[5].isEnabled = false
                                    case 12,13:
                                        self.hourLabels[6].setTitle("12:00~12:40 ✖️", for: .normal)
                                        self.hourLabels[6].isEnabled = false
                                    case 14,15:
                                        self.hourLabels[7].setTitle("15:00~15:40 ✖️", for: .normal)
                                        self.hourLabels[7].isEnabled = false
                                    case 16,17:
                                        self.hourLabels[8].setTitle("15:40~16:20 ✖️", for: .normal)
                                        self.hourLabels[8].isEnabled = false
                                    case 18,19:
                                        self.hourLabels[9].setTitle("16:20~17:00 ✖️", for: .normal)
                                        self.hourLabels[9].isEnabled = false
                                    case 20,21:
                                        self.hourLabels[10].setTitle("17:00~17:40 ✖️", for: .normal)
                                        self.hourLabels[10].isEnabled = false
                                    case 22,23:
                                        self.hourLabels[11].setTitle("17:40~18:20 ✖️", for: .normal)
                                        self.hourLabels[11].isEnabled = false
                                    
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
                                    case 0,1:
                                        self.hourLabels[0].setTitle("8:00~8:40 ✖️", for: .normal)
                                        self.hourLabels[0].isEnabled = false
                                    case 2,3:
                                        self.hourLabels[1].setTitle("8:40~9:20 ✖️", for: .normal)
                                        self.hourLabels[1].isEnabled = false
                                    case 4,5:
                                        self.hourLabels[2].setTitle("9:20~10:00 ✖️", for: .normal)
                                        self.hourLabels[2].isEnabled = false
                                    case 6,7:
                                        self.hourLabels[3].setTitle("10:00~10:40 ✖️", for: .normal)
                                        self.hourLabels[3].isEnabled = false
                                    case 8,9:
                                        self.hourLabels[4].setTitle("10:40~11:20 ✖️", for: .normal)
                                        self.hourLabels[4].isEnabled = false
                                    case 10,11:
                                        self.hourLabels[5].setTitle("11:20~12:00 ✖️", for: .normal)
                                        self.hourLabels[5].isEnabled = false
                                    case 12,13:
                                        self.hourLabels[6].setTitle("12:00~12:40 ✖️", for: .normal)
                                        self.hourLabels[6].isEnabled = false
                                    case 14,15:
                                        self.hourLabels[7].setTitle("15:00~15:40 ✖️", for: .normal)
                                        self.hourLabels[7].isEnabled = false
                                    case 16,17:
                                        self.hourLabels[8].setTitle("15:40~16:20 ✖️", for: .normal)
                                        self.hourLabels[8].isEnabled = false
                                    case 18,19:
                                        self.hourLabels[9].setTitle("16:20~17:00 ✖️", for: .normal)
                                        self.hourLabels[9].isEnabled = false
                                    case 20,21:
                                        self.hourLabels[10].setTitle("17:00~17:40 ✖️", for: .normal)
                                        self.hourLabels[10].isEnabled = false
                                    case 22,23:
                                        self.hourLabels[11].setTitle("17:40~18:20 ✖️", for: .normal)
                                        self.hourLabels[11].isEnabled = false
                                        
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
                                    case 0,1:
                                        self.hourLabels[0].setTitle("8:00~8:40 ✖️", for: .normal)
                                        self.hourLabels[0].isEnabled = false
                                    case 2,3:
                                        self.hourLabels[1].setTitle("8:40~9:20 ✖️", for: .normal)
                                        self.hourLabels[1].isEnabled = false
                                    case 4,5:
                                        self.hourLabels[2].setTitle("9:20~10:00 ✖️", for: .normal)
                                        self.hourLabels[2].isEnabled = false
                                    case 6,7:
                                        self.hourLabels[3].setTitle("10:00~10:40 ✖️", for: .normal)
                                        self.hourLabels[3].isEnabled = false
                                    case 8,9:
                                        self.hourLabels[4].setTitle("10:40~11:20 ✖️", for: .normal)
                                        self.hourLabels[4].isEnabled = false
                                    case 10,11:
                                        self.hourLabels[5].setTitle("11:20~12:00 ✖️", for: .normal)
                                        self.hourLabels[5].isEnabled = false
                                    case 12,13:
                                        self.hourLabels[6].setTitle("12:00~12:40 ✖️", for: .normal)
                                        self.hourLabels[6].isEnabled = false
                                    case 14,15:
                                        self.hourLabels[7].setTitle("15:00~15:40 ✖️", for: .normal)
                                        self.hourLabels[7].isEnabled = false
                                    case 16,17:
                                        self.hourLabels[8].setTitle("15:40~16:20 ✖️", for: .normal)
                                        self.hourLabels[8].isEnabled = false
                                    case 18,19:
                                        self.hourLabels[9].setTitle("16:20~17:00 ✖️", for: .normal)
                                        self.hourLabels[9].isEnabled = false
                                    case 20,21:
                                        self.hourLabels[10].setTitle("17:00~17:40 ✖️", for: .normal)
                                        self.hourLabels[10].isEnabled = false
                                    case 22,23:
                                        self.hourLabels[11].setTitle("17:40~18:20 ✖️", for: .normal)
                                        self.hourLabels[11].isEnabled = false
                                        
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
        }
    }
    
    @IBAction func hourButtons(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            self.hour = "8:00~8:40"
        case 1:
            self.hour = "8:40~9:20"
        case 2:
            self.hour = "9:20~10:00"
        case 3:
            self.hour = "10:00~10:40"
        case 4:
            self.hour = "10:40~11:20"
        case 5:
            self.hour = "11:20~12:00"
        case 6:
            self.hour = "12:00~12:40"
        case 7:
            self.hour = "15:00~15:40"
        case 8:
            self.hour = "15:40~16:20"
        case 9:
            self.hour = "16:20~17:00"
        case 10:
            self.hour = "17:00~17:40"
        case 11:
            self.hour = "17:40~18:20"
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
    
    

}
