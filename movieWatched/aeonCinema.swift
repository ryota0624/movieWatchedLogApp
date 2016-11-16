//
//  aeonCinema.swift
//  movieWatched
//
//  Created by suzukiryota on 2016/11/16.
//  Copyright © 2016年 kiryota. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AeonCinema {
    let url: String
    init(url: String) {
        self.url = url
    }
    
    func getSchedule(cb: @escaping (_ schedule: Schedule) -> Void) {
        Alamofire.request("\(url)/schedule").responseJSON(completionHandler: { response in
            if let scheduleRaw = response.result.value {
                let schedule = JSON(scheduleRaw)
                let movies = schedule["movies"].map { (_, obj) in movieJSON(obj) }
                cb(Schedule(movies: movies, date: schedule["date"].rawString()!))
            }
        })
    }
    
    func getMovieDetail(movie: Movie, cb: @escaping (_ movie: MovieDetail) -> Void) {
        Alamofire.request("\(url)/schedule").responseJSON(completionHandler: { response in
            if let movieDetailRaw = response.result.value {
                let movieDetail = JSON(movieDetailRaw)
                cb(movieDetailJSON(movieDetail, movie: movie))
            }
        })
    }
    
}
func movieDetailJSON(_ obj: JSON, movie: Movie) -> MovieDetail {
    return MovieDetail(
        id: obj["id"].rawString()!,
        title: obj["title"].rawString()!,
        story: obj["story"].rawString()!,
        pageUrl: obj["page_url"].rawString()!,
        movie: movie
    )
}
func movieJSON(_ obj: JSON) -> Movie {
    return Movie(
        id: obj["id"].rawString()!,
        thumbnailUrl: obj["thumbnail_url"].rawString()!,
        title: obj["title"].rawString()!,
        detailUrl: obj["detail_url"].rawString()!
    )
}
