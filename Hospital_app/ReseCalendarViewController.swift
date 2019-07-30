//
//  ReseCalendarViewController.swift
//  Hospital_app
//
//  Created by 大江祥太郎 on 2019/07/23.
//  Copyright © 2019 shotaro. All rights reserved.
//

import UIKit
import FSCalendar
import CalculateCalendarLogic
import NCMB
import SVProgressHUD

class ReseCalendarViewController: UIViewController,FSCalendarDelegate,FSCalendarDataSource,FSCalendarDelegateAppearance{
    
    var user = ""
    var rese_flag = 0
    var day = ""
    
    @IBOutlet weak var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // デリゲートの設定
        self.calendar.dataSource = self
        self.calendar.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate let gregorian: Calendar = Calendar(identifier: .gregorian)
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    // 祝日判定を行い結果を返すメソッド(True:祝日)
    func judgeHoliday(_ date : Date) -> Bool {
        //祝日判定用のカレンダークラスのインスタンス
        let tmpCalendar = Calendar(identifier: .gregorian)
        
        // 祝日判定を行う日にちの年、月、日を取得
        let year = tmpCalendar.component(.year, from: date)
        let month = tmpCalendar.component(.month, from: date)
        let day = tmpCalendar.component(.day, from: date)
        
        // CalculateCalendarLogic()：祝日判定のインスタンスの生成
        let holiday = CalculateCalendarLogic()
        
        return holiday.judgeJapaneseHoliday(year: year, month: month, day: day)
    }
    // date型 -> 年月日をIntで取得
    func getDay(_ date:Date) -> (Int,Int,Int){
        let tmpCalendar = Calendar(identifier: .gregorian)
        let year = tmpCalendar.component(.year, from: date)
        let month = tmpCalendar.component(.month, from: date)
        let day = tmpCalendar.component(.day, from: date)
        return (year,month,day)
    }
    
    //曜日判定(日曜日:1 〜 土曜日:7)
    func getWeekIdx(_ date: Date) -> Int{
        let tmpCalendar = Calendar(identifier: .gregorian)
        return tmpCalendar.component(.weekday, from: date)
    }
    
    // 土日や祝日の日の文字色を変える
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        //祝日判定をする（祝日は赤色で表示する）
        if self.judgeHoliday(date){
            return UIColor.red
        }
        
        //土日の判定を行う（土曜日は青色、日曜日は赤色で表示する）
        let weekday = self.getWeekIdx(date)
        if weekday == 1 {   //日曜日
            return UIColor.red
        }
        else if weekday == 7 {  //土曜日
            return UIColor.blue
        }
        
        return nil
    }
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition)
    {
        let selectDay = getDay(date)
        
        self.day = String(selectDay.0)+"年"+String(selectDay.1)+"月"+String(selectDay.2)+"日"
        self.navigationItem.title = day
        
        
        
        print(user)
        
        let query = NCMBQuery(className: "Users")
        
        query?.findObjectsInBackground({ (result, error) in
            if error != nil{
                SVProgressHUD.dismiss()
            }else{
                for userObject in result as! [NCMBObject]{
                    let userId = userObject.object(forKey: "userId") as! String
                    
                    if self.user == userId{
                        
                        if userObject.object(forKey: "FirstReseDay") == nil{
                            self.rese_flag = 1
                        }else if userObject.object(forKey: "SecondReseDay") == nil{
                            self.rese_flag = 2
                        }else if userObject.object(forKey: "ThirdReseDay") == nil{
                            self.rese_flag = 3
                        }else if userObject.object(forKey: "FourthReseDay") == nil{
                            self.rese_flag = 4
                        }else if userObject.object(forKey: "FifthReseDay") == nil{
                            self.rese_flag = 5
                        }else{
                            SVProgressHUD.showInfo(withStatus: "これ以上予約できません。")
                            return
                        }
                        print(self.rese_flag)
                        //userId取得
                        self.performSegue(withIdentifier: "toHour", sender: nil)
                        

                        
                    }else{
                        
                    }
                    
                }
            }
        })
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toHour" {
            let hourVC = segue.destination as! ReseHourViewController
            hourVC.rese_flag = rese_flag
            hourVC.user = user
            hourVC.day = day
        }
        
    }
    
}
