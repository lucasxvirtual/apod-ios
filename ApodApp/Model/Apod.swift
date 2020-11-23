//
//  Apod.swift
//  Apod
//
//  Created by Lucas Silva on 22/11/20.
//  Copyright © 2020 Lucas Silva. All rights reserved.
//

import Foundation

struct Apod: Identifiable, Decodable{
    var id = UUID()
    let date : String
    let explanation : String
    let mediaType : String
    let title : String
    let url : String
    let hdUrl : String
    
    enum ApodKeys: String, CodingKey {
        case date = "date"
        case explanation = "explanation"
        case mediaType = "media_type"
        case title = "title"
        case url = "url"
        case hdUrl = "hdurl"
    }
    
    init(date : String, explanation : String, mediaType : String, title : String, url : String, hdUrl : String) {
        self.date = date
        self.explanation = explanation
        self.mediaType = mediaType
        self.title = title
        self.url = url
        self.hdUrl = hdUrl
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ApodKeys.self)
        let date: String = try container.decode(String.self, forKey: .date)
        let explanation: String = try container.decode(String.self, forKey: .explanation)
        let mediaType: String = try container.decode(String.self, forKey: .mediaType)
        let title: String = try container.decode(String.self, forKey: .title)
        let url: String = try container.decode(String.self, forKey: .url)
        let hdUrl: String = try container.decode(String.self, forKey: .hdUrl)

        self.init(date: date, explanation: explanation, mediaType: mediaType, title: title, url: url, hdUrl: hdUrl)
    }
    
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let formatterTo = DateFormatter()
        formatterTo.dateFormat = "dd/MM/yyyy"
        
        if let date = formatter.date(from: self.date) {
            return formatterTo.string(from: date)
        }
        
        return ""
    }
    
}
