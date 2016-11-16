//
//  Schedule.swift
//  movieWatched
//
//  Created by suzukiryota on 2016/11/16.
//  Copyright © 2016年 kiryota. All rights reserved.
//

import Foundation

class Schedule {
    let movies: [Movie]
    let date: String
    init(movies: [Movie], date: String) {
        self.movies = movies
        self.date = date
    }
}

struct Movie {
    init(id: String, thumbnailUrl: String, title: String, detailUrl: String) {
        self.id = id
        self.thumbnailUrl = thumbnailUrl
        self.title = title
        self.detailUrl = detailUrl
    }
    let id: String
    let thumbnailUrl: String
    let title: String
    let detailUrl: String
}
