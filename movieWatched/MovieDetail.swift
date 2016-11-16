//
//  MovieDetail.swift
//  movieWatched
//
//  Created by suzukiryota on 2016/11/16.
//  Copyright © 2016年 kiryota. All rights reserved.
//

import Foundation

class MovieDetail {
    let id: String
    let title: String
    let story: String
    let pageUrl: String
    let movie: Movie
    init(id: String, title: String, story: String, pageUrl: String, movie: Movie) {
        self.id = id
        self.title = title
        self.story = story
        self.pageUrl = pageUrl
        self.movie = movie
    }
}
