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
    
    var userName = ""
    
    
    var userNames = [String]()
    
    
    var row_check = 0
    
    @IBOutlet var hourLabels: [UIButton]!
    
    let Minutes20 = ["8:00~8:20","8:20~8:40","8:40~9:00","9:00~9:20","9:20~9:40","9:40~10:00","10:00~10:20","10:20~10:40","10:40~11:00","11:00~11:20","11:20~11:40","11:40~12:00","12:00~12:20","12:20~12:40","15:00~15:20","15:20~15:40","15:40~16:00","16:00~16:20","16:20~16:40","16:40~17:00","17:00~17:20","17:20~17:40","17:40~18:00","18:00~18:20","18:20~18:40"]
    
    let ptCheck = ["PT1","PT2","PT3"]
    let ptClassName = ["pt1_yoyaku","pt2_yoyaku","pt3_yoyaku"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func viewWillAppear(_ animated: Bool) {
        let query = NCMBQuery(className: "Users")
        
        query?.findObjectsInBackground({ (result, error) in
            if error != nil{
                SVProgressHUD.dismiss()
            }else{
                for userObject in result as! [NCMBObject]{
                    let name = userObject.object(forKey: "userName") as! String
                    self.userNames.append(name)
                }
            }
        })
        self.navigationItem.title = self.userName
        print(userNames)
        loadButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toConfirm"{
            let reseConfirmVC = segue.destination as! ReseConfirmViewController
            reseConfirmVC.user = user
            reseConfirmVC.rese_flag = rese_flag
            reseConfirmVC.day = day
            reseConfirmVC.hour = hour
            reseConfirmVC.pt = pt
            reseConfirmVC.userName = userName
        }
    }
    
    func loadButton(){
        for i in 0...2 {
            if self.pt == ptCheck[i]{
                let query = NCMBQuery(className: ptClassName[i])
                query?.findObjectsInBackground({ (result, error) in
                    if error != nil{
                        
                    }else{
                        
                        for userObject in result as! [NCMBObject]{
                            let userDate = userObject.object(forKey: "date") as? String
                            
                            if self.day == userDate{
                                
                                for i in 0...24{
                                    
                                    for name in self.userNames{
                                        if userObject.object(forKey: String(i)) != nil{
                                            if String(name) == userObject.object(forKey: String(i)) as! String{
                                                if self.userName == String(name){
                                                    self.hourLabels[i].setTitle(self.Minutes20[i]+"  "+self.userName, for: .normal)
                                                    self.hourLabels[i].isEnabled = false
                                                }else{
                                                    self.hourLabels[i].setTitle(self.Minutes20[i]+"✖️", for: .normal)
                                                    self.hourLabels[i].isEnabled = false
                                                }
                                            }
                                        }else{
                                            
                                            self.hourLabels[i].setTitle(self.Minutes20[i]+"◯", for: .normal)
                                            self.hourLabels[i].isEnabled = true
                                        }
                                    }
                                    
                                }
                                
                                
                            }
                            
                        }
                    }
                })
            }
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
        print(self.pt)
        loadButton()
    }
    
    
}




