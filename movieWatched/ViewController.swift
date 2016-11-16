//
//  ViewController.swift
//  movieWatched
//
//  Created by suzukiryota on 2016/11/16.
//  Copyright © 2016年 kiryota. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var headerParent: UIView!
    @IBOutlet weak var viewParent: UIView!
    var scheduleView: MovieListView!
    var scheduleHeader: ScheduleHeader!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        scheduleView = UINib(nibName: "MovieListView", bundle: nil).instantiate(withOwner: self, options: nil).first as? MovieListView
        scheduleHeader = UINib(nibName: "ScheduleHeader", bundle: nil).instantiate(withOwner: self, options: nil).first as? ScheduleHeader
        
        addSubvieWithAutoLayout(childView: scheduleView, parentView: viewParent)
        addSubvieWithAutoLayout(childView: scheduleHeader, parentView: headerParent)

        // Do any additional setup after loading the view, typically from a nib.
        AeonCinema(url: "http://localhost:8080").getSchedule(cb: { schedule in
            self.scheduleView.setMovies(schedule: schedule)
            self.scheduleHeader.setState(date: schedule.date)
        })
        
        self.scheduleHeader.setHandler(next: { _ in print("next")}, prev: { _ in print("prev")})
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

