//
//  ViewController.swift
//  Countdown
//
//  Created by Jake Krammer on 7/9/16.
//  Copyright © 2016 Soupsnakes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var newDateButton: UIButton!
    
    
    @IBOutlet weak var resultDate: UILabel!
    
    @IBOutlet weak var firstresultDate: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userCalendar = NSCalendar.currentCalendar()
        
        let todaysDate:NSDate = NSDate()
        let dateFormatter:NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        
        // Do any additional setup after loading the view, typically from a nib.
        let defaults = NSUserDefaults.standardUserDefaults()
    
        let countdownDate: NSDate = NSUserDefaults.standardUserDefaults().objectForKey("countdownDate") as! NSDate

        let countdownDateStr = dateFormatter.stringFromDate(countdownDate)
     
        
        dateFormatter.dateFormat = "yyyy/MM/dd hh:mm a Z"
        let startTime = todaysDate
        let endTime = countdownDate
        let hourMinuteComponents: NSCalendarUnit = [.Day, .Hour, .Minute, .Second]
        let timeDifference = userCalendar.components(
            hourMinuteComponents,
            fromDate: startTime,
            toDate: endTime,
            options: [])
        let hours = timeDifference.hour
        let minutes = timeDifference.minute
        let days = timeDifference.day
        let seconds = timeDifference.second
        
        firstresultDate.text = "\(days) days"
        
        resultDate.text = "\(hours) : \(minutes) : \(seconds)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

