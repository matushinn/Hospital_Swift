//
//  CancelHourViewController.swift
//  Hospital_app
//
//  Created by 大江祥太郎 on 2019/08/02.
//  Copyright © 2019 shotaro. All rights reserved.
//

import NCMB
import SVProgressHUD

class CancelHourViewController: UIViewController {
    
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
    
    
    let indexes = ["0":0,"1":0,"2":1,"3":1,"4":2,"5":2,"6":3,"7":3,"8":4,"9":4,"10":5,"11":5,"12":6,"13":6,"14":7,"15":7,"16":8,"17":8,"18":9,"19":9,"20":10,"21":10,"22":11,"23":11,"24":11]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = self.userName
        loadButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCancelConfirm"{
            let cancelVC = segue.destination as! CancelConfirmViewController
            cancelVC.user = user
            cancelVC.rese_flag = rese_flag
            cancelVC.day = day
            cancelVC.hour = hour
            cancelVC.pt = pt
            cancelVC.userName = userName
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
                                                    self.hourLabels[i].isEnabled = true
                                                }else{
                                                    self.hourLabels[i].setTitle(self.Minutes20[i]+"✖️", for: .normal)
                                                    self.hourLabels[i].isEnabled = false
                                                }
                                            }
                                        }else{
                                            
                                            self.hourLabels[i].setTitle(self.Minutes20[i]+"◯", for: .normal)
                                            self.hourLabels[i].isEnabled = false
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
        self.loadButton()
        
        self.performSegue(withIdentifier: "toCancelConfirm", sender: nil)
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
        loadButton()
    }
    

    
   
    
}


