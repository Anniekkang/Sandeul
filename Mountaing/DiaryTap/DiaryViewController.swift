//
//  DiaryViewController.swift
//  Mountaing
//
//  Created by 나리강 on 2022/09/14.
//

import UIKit
import FSCalendar
import SnapKit


class DiaryViewController: BaseViewController, FSCalendarDelegate, FSCalendarDataSource {
    
    fileprivate weak var calendar: FSCalendar!
    fileprivate weak var eventLabel : UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = colorCustom.shared.whiteBackgroundColor
        calendarHeader()
        calendarFont()
        calendarSetup()
        eventSetup()
        
        let scopeGesture = UIPanGestureRecognizer(target: calendar, action: #selector(calendar.handleScopeGesture(_:)))
        calendar.addGestureRecognizer(scopeGesture)
        
        self.navigationItem.titleView = logoSetup()
        
    }
    
    
    override func configuration() {
        let calendar = FSCalendar(frame: CGRect(x: 15, y: (self.navigationController?.navigationBar.frame.maxY)!, width: view.frame.size.width - 30, height: view.frame.size.height * 0.5))
        calendar.dataSource = self
        calendar.delegate = self
        calendar.allowsMultipleSelection = true
        view.addSubview(calendar)
        self.calendar = calendar
        calendar.scope = .month
        
        
        
    }
    
    
    func calendarHeader(){
        calendar.headerHeight = 80
        calendar.calendarHeaderView.backgroundColor = .clear
        calendar.calendarWeekdayView.backgroundColor = .clear
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        calendar.appearance.headerDateFormat = "M월"
        calendar.appearance.headerTitleFont = Font.customfirst.extraLargefont
        calendar.appearance.headerTitleAlignment = .center
        calendar.appearance.headerTitleColor = colorCustom.shared.lightBlackColor
        
    }
    
    func eventSetup(){
        
      
        let label = UILabel(frame: CGRect(x: 0, y: calendar.frame.maxY + 10 , width: self.view.frame.width, height: 50))
        label.textAlignment = .center
        label.font = Font.customfirst.largeFont
        
        //label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor = colorCustom.shared.lightBlackColor
        self.view.addSubview(label)
        self.eventLabel = label

        let attributedText = NSMutableAttributedString(string: "")
        attributedText.append(NSAttributedString(string: " Mountain Diary "))
    
        label.attributedText = attributedText

        calendar.appearance.eventSelectionColor = colorCustom.shared.lightBlackColor
        calendar.appearance.eventDefaultColor = colorCustom.shared.greenColor
        calendar.appearance.borderRadius = 1
    }
    
    func calendarFont(){
        calendar.appearance.weekdayFont = Font.customfirst.smallFont
        calendar.appearance.weekdayTextColor = colorCustom.shared.greenColor
        calendar.appearance.titleWeekendColor = .systemRed
        calendar.appearance.titleDefaultColor = colorCustom.shared.lightBlackColor
       
        calendar.locale = Locale(identifier: "ko_KR")
        
    }
    
    func calendarSetup(){
        
        
        calendar.appearance.selectionColor = colorCustom.shared.lightgreenColor//UIColor(red: 188/255, green: 224/255, blue: 253/255, alpha: 1)
        calendar.appearance.todayColor = colorCustom.shared.greenColor //UIColor(red: 38/255, green: 153/255, blue: 251/255, alpha: 1)
        calendar.scrollEnabled = true
        calendar.scrollDirection = .horizontal
        calendar.swipeToChooseGesture.isEnabled = true
        calendar.register(DiaryCell.self, forCellReuseIdentifier: "cell")
        
        
    }
    
}


extension DiaryViewController : FSCalendarDelegateAppearance {
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        
//        let pushView = DetailViewController()
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-mm-dd"
//        pushView.mainView.dateLabel.text = dateFormatter.string(from: date)
//
//        self.navigationController?.pushViewController(pushView, animated: true)
        
    }
    
    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
        let cell = calendar.dequeueReusableCell(withIdentifier: "cell", for: date, at: position)
        return cell
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        return 2
    }
    
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        
        self.calendar.frame.size.height = bounds.height
        self.eventLabel.frame.origin.y = calendar.frame.maxY + 10
        
    }
    
    
        
   
    
    
}









