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

    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var firstReseDateLabel: UIButton!
    
    @IBOutlet weak var secondReseDateLabel: UIButton!
    
    @IBOutlet weak var thirdReseDateLabel: UIButton!
    
    @IBOutlet weak var fourthReseDateLabel: UIButton!
    
    @IBOutlet weak var fifthReseDateLabel: UIButton!
    
    var user = ""
    var pt = ""
    var day  = ""
    var hour_flag = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        let query = NCMBQuery(className: "Users")
        
        query?.findObjectsInBackground({ (result, error) in
            if error != nil{
                SVProgressHUD.dismiss()
            }else{
                for userObject in result as! [NCMBObject]{
                    let userId = userObject.object(forKey: "userId") as! String
                    
                    if self.user == userId{
                       self.userNameLabel.text = userObject.object(forKey: "userName") as! String
                        
                        if userObject.object(forKey: "FirstReseDate") != nil{
                            self.day = userObject.object(forKey: "FirstReseDay") as! String
                            self.hour_flag = userObject.object(forKey: "FirstHourFlag") as! String
                            self.firstReseDateLabel.setTitle(userObject.object(forKey: "FirstReseDate") as! String, for: .normal)
                        }else{
                            self.firstReseDateLabel.setTitle("予約しておりません。", for: .normal)
                            
                                self.firstReseDateLabel.isEnabled = false
                        }
                        if userObject.object(forKey: "SecondReseDate") != nil{
                            self.day = userObject.object(forKey: "SecondReseDay") as! String
                           self.hour_flag = userObject.object(forKey: "SecondHourFlag") as! String
                            self.secondReseDateLabel.setTitle(userObject.object(forKey: "SecondReseDate") as! String, for: .normal)
                        }else{
                            self.secondReseDateLabel.setTitle("予約しておりません。", for: .normal)
                            
                            self.secondReseDateLabel.isEnabled = false
                        }
                        if userObject.object(forKey: "ThirdReseDate") != nil{
                           self.day = userObject.object(forKey: "ThirdReseDay") as! String
                            self.hour_flag = userObject.object(forKey: "ThirdHourFlag") as! String
                            self.thirdReseDateLabel.setTitle(userObject.object(forKey: "ThirdReseDate") as! String, for: .normal)
                        }else{
                            self.thirdReseDateLabel.setTitle("予約しておりません。", for: .normal)
                            
                            self.thirdReseDateLabel.isEnabled = false
                        }
                        if userObject.object(forKey: "FourthReseDate") != nil{
                            self.day = userObject.object(forKey: "FourthReseDay") as! String
                            self.hour_flag = userObject.object(forKey: "FourthHourFlag") as! String
                            self.fourthReseDateLabel.setTitle(userObject.object(forKey: "FourthReseDate") as! String, for: .normal)
                        }else{
                            self.fourthReseDateLabel.setTitle("予約しておりません。", for: .normal)
                            
                            self.fourthReseDateLabel.isEnabled = false
                        }
                        if userObject.object(forKey: "FifthReseDate") != nil{
                            self.day = userObject.object(forKey: "FiftheseDay") as! String
                            self.hour_flag = userObject.object(forKey: "FifthHourFlag") as! String
                            self.fifthReseDateLabel.setTitle(userObject.object(forKey: "FifthReseDate") as! String, for: .normal)
                        }else{
                            self.fifthReseDateLabel.setTitle("予約しておりません。", for: .normal)
                            
                            self.fifthReseDateLabel.isEnabled = false
                        }
                }
            }
        }
        })
        
    }
    
    @IBAction func date(_ sender:UIButton) {
        
        let alert = UIAlertController(title: "予約キャンセル", message: "本当によろしいですか？", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            switch sender.tag {
            case 1:
                let query = NCMBQuery(className: "Users")
                
                query?.findObjectsInBackground({ (result, error) in
                    if error != nil{
                        SVProgressHUD.dismiss()
                    }else{
                        for userObject in result as! [NCMBObject]{
                            let userId = userObject.object(forKey: "userId") as! String
                            
                            if self.user == userId{
                                userObject.setObject(nil, forKey: "FirstReseDate")
                                userObject.setObject(nil, forKey: "FirstReseDay")
                                userObject.saveInBackground({ (error) in
                                    if error != nil{
                                        print(error)
                                    }else{
                                        print("Update Succeed")
                                    }
                                })
                                self.pt = userObject.object(forKey: "FirstPT") as! String
                            }
                        }
                    }
                })
                switch self.pt{
                case "PT1":
                    let pt1_query = NCMBQuery(className: "pt1_yoyaku")
                    
                    pt1_query?.findObjectsInBackground({ (result, error) in
                        if error != nil{
                            
                        }else{
                            for userObject in result as! [NCMBObject]{
                                let userDate = userObject.object(forKey: "date") as? String
                                
                                if self.day == userDate{
                                    
                                    userObject.setObject(nil, forKey: self.hour_flag)
                                    
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
                    let pt1_query = NCMBQuery(className: "pt2_yoyaku")
                    
                    pt1_query?.findObjectsInBackground({ (result, error) in
                        if error != nil{
                            
                        }else{
                            for userObject in result as! [NCMBObject]{
                                let userDate = userObject.object(forKey: "date") as? String
                                
                                if self.day == userDate{
                                    
                                    userObject.setObject(nil, forKey: self.hour_flag)
                                    
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
                    let pt1_query = NCMBQuery(className: "pt3_yoyaku")
                    
                    pt1_query?.findObjectsInBackground({ (result, error) in
                        if error != nil{
                            
                        }else{
                            for userObject in result as! [NCMBObject]{
                                let userDate = userObject.object(forKey: "date") as? String
                                
                                if self.day == userDate{
                                    
                                    userObject.setObject(nil, forKey: self.hour_flag)
                                    
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
            case 2:
                let query = NCMBQuery(className: "Users")
                
                query?.findObjectsInBackground({ (result, error) in
                    if error != nil{
                        SVProgressHUD.dismiss()
                    }else{
                        for userObject in result as! [NCMBObject]{
                            let userId = userObject.object(forKey: "userId") as! String
                            
                            if self.user == userId{
                                userObject.setObject(nil, forKey: "SecondReseDate")
                                userObject.setObject(nil, forKey: "SecondReseDay")
                                userObject.saveInBackground({ (error) in
                                    if error != nil{
                                        print(error)
                                    }else{
                                        print("Update Succeed")
                                    }
                                })
                                self.pt = userObject.object(forKey: "SecondPT") as! String
                            }
                        }
                    }
                })
                switch self.pt{
                case "PT1":
                    let pt1_query = NCMBQuery(className: "pt1_yoyaku")
                    
                    pt1_query?.findObjectsInBackground({ (result, error) in
                        if error != nil{
                            
                        }else{
                            for userObject in result as! [NCMBObject]{
                                let userDate = userObject.object(forKey: "date") as? String
                                
                                if self.day == userDate{
                                    
                                    userObject.setObject(nil, forKey: self.hour_flag)
                                    
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
                    let pt1_query = NCMBQuery(className: "pt2_yoyaku")
                    
                    pt1_query?.findObjectsInBackground({ (result, error) in
                        if error != nil{
                            
                        }else{
                            for userObject in result as! [NCMBObject]{
                                let userDate = userObject.object(forKey: "date") as? String
                                
                                if self.day == userDate{
                                    
                                    userObject.setObject(nil, forKey: self.hour_flag)
                                    
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
                    let pt1_query = NCMBQuery(className: "pt3_yoyaku")
                    
                    pt1_query?.findObjectsInBackground({ (result, error) in
                        if error != nil{
                            
                        }else{
                            for userObject in result as! [NCMBObject]{
                                let userDate = userObject.object(forKey: "date") as? String
                                
                                if self.day == userDate{
                                    
                                    userObject.setObject(nil, forKey: self.hour_flag)
                                    
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
            case 3:
                let query = NCMBQuery(className: "Users")
                
                query?.findObjectsInBackground({ (result, error) in
                    if error != nil{
                        SVProgressHUD.dismiss()
                    }else{
                        for userObject in result as! [NCMBObject]{
                            let userId = userObject.object(forKey: "userId") as! String
                            
                            if self.user == userId{
                                userObject.setObject(nil, forKey: "ThirdReseDate")
                                userObject.setObject(nil, forKey: "ThirdReseDay")
                                userObject.saveInBackground({ (error) in
                                    if error != nil{
                                        print(error)
                                    }else{
                                        print("Update Succeed")
                                    }
                                })
                                self.pt = userObject.object(forKey: "ThirdPT") as! String
                            }
                        }
                    }
                })
                switch self.pt{
                case "PT1":
                    let pt1_query = NCMBQuery(className: "pt1_yoyaku")
                    
                    pt1_query?.findObjectsInBackground({ (result, error) in
                        if error != nil{
                            
                        }else{
                            for userObject in result as! [NCMBObject]{
                                let userDate = userObject.object(forKey: "date") as? String
                                
                                if self.day == userDate{
                                    
                                    userObject.setObject(nil, forKey: self.hour_flag)
                                    
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
                    let pt1_query = NCMBQuery(className: "pt2_yoyaku")
                    
                    pt1_query?.findObjectsInBackground({ (result, error) in
                        if error != nil{
                            
                        }else{
                            for userObject in result as! [NCMBObject]{
                                let userDate = userObject.object(forKey: "date") as? String
                                
                                if self.day == userDate{
                                    
                                    userObject.setObject(nil, forKey: self.hour_flag)
                                    
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
                    let pt1_query = NCMBQuery(className: "pt3_yoyaku")
                    
                    pt1_query?.findObjectsInBackground({ (result, error) in
                        if error != nil{
                            
                        }else{
                            for userObject in result as! [NCMBObject]{
                                let userDate = userObject.object(forKey: "date") as? String
                                
                                if self.day == userDate{
                                    
                                    userObject.setObject(nil, forKey: self.hour_flag)
                                    
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
            case 4:
                let query = NCMBQuery(className: "Users")
                
                query?.findObjectsInBackground({ (result, error) in
                    if error != nil{
                        SVProgressHUD.dismiss()
                    }else{
                        for userObject in result as! [NCMBObject]{
                            let userId = userObject.object(forKey: "userId") as! String
                            
                            if self.user == userId{
                                userObject.setObject(nil, forKey: "FourthReseDate")
                                userObject.setObject(nil, forKey: "FourthReseDay")
                                userObject.saveInBackground({ (error) in
                                    if error != nil{
                                        print(error)
                                    }else{
                                        print("Update Succeed")
                                    }
                                })
                                self.pt = userObject.object(forKey: "FourthPT") as! String
                            }
                        }
                    }
                })
                switch self.pt{
                case "PT1":
                    let pt1_query = NCMBQuery(className: "pt1_yoyaku")
                    
                    pt1_query?.findObjectsInBackground({ (result, error) in
                        if error != nil{
                            
                        }else{
                            for userObject in result as! [NCMBObject]{
                                let userDate = userObject.object(forKey: "date") as? String
                                
                                if self.day == userDate{
                                    
                                    userObject.setObject(nil, forKey: self.hour_flag)
                                    
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
                    let pt1_query = NCMBQuery(className: "pt2_yoyaku")
                    
                    pt1_query?.findObjectsInBackground({ (result, error) in
                        if error != nil{
                            
                        }else{
                            for userObject in result as! [NCMBObject]{
                                let userDate = userObject.object(forKey: "date") as? String
                                
                                if self.day == userDate{
                                    
                                    userObject.setObject(nil, forKey: self.hour_flag)
                                    
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
                    let pt1_query = NCMBQuery(className: "pt3_yoyaku")
                    
                    pt1_query?.findObjectsInBackground({ (result, error) in
                        if error != nil{
                            
                        }else{
                            for userObject in result as! [NCMBObject]{
                                let userDate = userObject.object(forKey: "date") as? String
                                
                                if self.day == userDate{
                                    
                                    userObject.setObject(nil, forKey: self.hour_flag)
                                    
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
            case 5:
                let query = NCMBQuery(className: "Users")
                
                query?.findObjectsInBackground({ (result, error) in
                    if error != nil{
                        SVProgressHUD.dismiss()
                    }else{
                        for userObject in result as! [NCMBObject]{
                            let userId = userObject.object(forKey: "userId") as! String
                            
                            if self.user == userId{
                                userObject.setObject(nil, forKey: "FifthReseDate")
                                userObject.setObject(nil, forKey: "FifthReseDay")
                                userObject.saveInBackground({ (error) in
                                    if error != nil{
                                        print(error)
                                    }else{
                                        print("Update Succeed")
                                    }
                                })
                                self.pt = userObject.object(forKey: "FifthPT") as! String
                            }
                        }
                    }
                })
                switch self.pt{
                case "PT1":
                    let pt1_query = NCMBQuery(className: "pt1_yoyaku")
                    
                    pt1_query?.findObjectsInBackground({ (result, error) in
                        if error != nil{
                            
                        }else{
                            for userObject in result as! [NCMBObject]{
                                let userDate = userObject.object(forKey: "date") as? String
                                
                                if self.day == userDate{
                                    
                                    userObject.setObject(nil, forKey: self.hour_flag)
                                    
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
                    let pt1_query = NCMBQuery(className: "pt2_yoyaku")
                    
                    pt1_query?.findObjectsInBackground({ (result, error) in
                        if error != nil{
                            
                        }else{
                            for userObject in result as! [NCMBObject]{
                                let userDate = userObject.object(forKey: "date") as? String
                                
                                if self.day == userDate{
                                    
                                    userObject.setObject(nil, forKey: self.hour_flag)
                                    
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
                    let pt1_query = NCMBQuery(className: "pt3_yoyaku")
                    
                    pt1_query?.findObjectsInBackground({ (result, error) in
                        if error != nil{
                            
                        }else{
                            for userObject in result as! [NCMBObject]{
                                let userDate = userObject.object(forKey: "date") as? String
                                
                                if self.day == userDate{
                                    
                                    userObject.setObject(nil, forKey: self.hour_flag)
                                    
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
                        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
                        
                    })
                default:
                    break
                }
                
            default:
                break
            }
        }
        let cancelAction = UIAlertAction(title: "キャンセル", style: .default, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
        
        
        
        
    }
    
    
}
