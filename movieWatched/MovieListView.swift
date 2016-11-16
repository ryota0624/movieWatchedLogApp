//
//  MovieListView.swift
//  movieWatched
//
//  Created by suzukiryota on 2016/11/16.
//  Copyright © 2016年 kiryota. All rights reserved.
//

import Foundation
import UIKit

class MovieListView: UITableView {
    var schedule: Schedule!
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        self.delegate = self
        self.dataSource = self
        
        self.schedule = Schedule(movies: [], date: "")
        let nib = UINib(nibName: "ScheduleMovieCell", bundle: nil)
        self.register(nib, forCellReuseIdentifier: "ScheduleMovieCell")

    }
    
}

extension MovieListView: UITableViewDelegate, UITableViewDataSource, ImageFetchManager {
    func tableView(_ table: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedule.movies.count
    }
    
    func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = schedule.movies[indexPath.row]
        let cell = self.dequeueReusableCell(withIdentifier: "ScheduleMovieCell") as! ScheduleMovieCell
        fetchImg("http://www.aeoncinema.com\(movie.thumbnailUrl)", cb: { data in
            if let data = data {
                let img = UIImage(data: data)
                cell.movieImage.image = img
                
            }
        })
        cell.title.text = movie.title
        dump(movie)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func setMovies(schedule: Schedule) {
        self.schedule = schedule
        self.reloadData()
    }
}
