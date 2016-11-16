//
//  imageFetcher.swift
//  movieWatched
//
//  Created by suzukiryota on 2016/11/16.
//  Copyright © 2016年 kiryota. All rights reserved.
//

import Foundation

//
//  imageFetchManager.swift
//  movielist
//
//  Created by suzukiryota on 2016/11/13.
//  Copyright © 2016年 kiryota. All rights reserved.
//

import Foundation
import Alamofire

protocol ImageFetchManager {
}

var cache: [String: Data] = [:]

extension ImageFetchManager {
    func fetchImg(_ urlString: String, cb: @escaping (_ data: Data?) -> Void) {
        if let cachedData = cache[urlString] {
            cb(cachedData)
        } else {
            let url = URL(string: urlString)
            Alamofire.request(url!).responseData(completionHandler: ({ response in
                if let data = response.data {
                    cache.updateValue(data, forKey: urlString)
                }
                cb(response.data)
            }))
        }
        
    }
}
