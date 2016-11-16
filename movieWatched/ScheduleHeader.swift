//
//  scheduleDate.swift
//  movieWatched
//
//  Created by suzukiryota on 2016/11/17.
//  Copyright © 2016年 kiryota. All rights reserved.
//

import Foundation
import UIKit
typealias touchHandler = (_ sender: UIButton) -> Void
class ScheduleHeader: UIView {
    var touchNextHandler: touchHandler!
    var touchPrevHandler: touchHandler!

    @IBAction func touchNext(_ sender: UIButton) {
        touchNextHandler(sender)
    }
    @IBAction func touchPrev(_ sender: UIButton) {
        touchPrevHandler(sender)
    }
    
    @IBOutlet weak var dateLabel: UILabel!
    func setState(date: String) {
        dateLabel.text = date
    }
    
    func setHandler(next: @escaping touchHandler, prev: @escaping touchHandler) {
        self.touchNextHandler = next
        self.touchPrevHandler = prev
    }
}
