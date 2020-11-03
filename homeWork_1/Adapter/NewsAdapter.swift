//
//  NewsAdapter.swift
//  homeWork_1
//
//  Created by Alexander Myskin on 02.11.2020.
//  Copyright © 2020 Марат Нургалиев. All rights reserved.
//

import Foundation

class NewsAdapter: VkApiFeedsDelegate {
    
    private var feeds = [VkFeed]()
    
    func returnFeeds(_ feeds: [VkFeed]) {
        self.feeds.append(contentsOf: feeds)

    }
    
 
    
    var startFrom = ""
    private var needClearNews = true
    private var isLoad = false
    
    func prepareGetFeeds(needClearNews: Bool , completion: @escaping ([VkFeed]) -> Void) {
        isLoad = true
        self.needClearNews = needClearNews
        AlamofireService.instance.getNews(startFrom: needClearNews ? "":startFrom){ (news) in
            
            completion(news)
        }
    }
    
    func getNews(  completion: @escaping ([VkFeed]) -> Void) {
        prepareGetFeeds(needClearNews: true){ (news) in
            completion(news)
        }
        
    }
    

    
}
