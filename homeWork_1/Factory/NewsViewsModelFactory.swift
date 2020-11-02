//
//  NewsViewsModelFactory.swift
//  homeWork_1
//
//  Created by Alexander Myskin on 02.11.2020.
//  Copyright © 2020 Марат Нургалиев. All rights reserved.
//

import UIKit
import SDWebImage

class NewsViewsModelFactory {
    
    func constructViewModels(from news: [VkFeed]) -> [NewsViewsModel] {
        return news.compactMap(self.getViewModel)
    }
    
    
    private func getViewModel(from news: VkFeed) -> NewsViewsModel {
        
        
        let dateLabelText = news.getFeedDate()
        let labelFeedGroupHeaderText = news.sourceName
        let labelText = news.feedText
        let labelLike = news.getStringFrom(count: news.countLikes)
        let labelViews = news.getStringFrom(count: news.countViews)
        let labelShare = news.getStringFrom(count: news.countReposts)
        let labelComment = news.getStringFrom(count: news.countComments)
        let newsImage = UIImageView()
        newsImage.sd_setImage(with: URL(string: news.sourceUrl), placeholderImage: UIImage(named: "noPhoto"))
        
        

        return NewsViewsModel(dateLabelText: dateLabelText,
                              labelFeedGroupHeaderText: labelFeedGroupHeaderText,
                              labelText: labelText,
                              labelLike: labelLike,
                              labelViews: labelViews,
                              labelShare: labelShare,
                              labelComment: labelComment,
                              newsImage: newsImage)
    }
    
    private static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH.mm"
        return dateFormatter
    }()
    
    
}
