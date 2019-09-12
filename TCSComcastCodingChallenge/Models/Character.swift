//
//  Character.swift
//  TCSComcastCodingChallenge
//
//  Created by Afnan Mirza on 9/5/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import Foundation

struct DuckDuckGoResponse: Codable {
    let heading: String
    let relatedTopics: [RelatedTopic]
    
    enum CodingKeys: String, CodingKey {
        case heading = "Heading"
        case relatedTopics = "RelatedTopics"
    }
}

struct RelatedTopic: Codable {
    let icon: Icon
    let characterFullDescription: String
    
    enum CodingKeys: String, CodingKey {
        case icon = "Icon"
        case characterFullDescription = "Text"
    }
}

struct Icon: Codable {
    let characterImgUrl: String
    
    enum CodingKeys: String, CodingKey {
        case characterImgUrl = "URL"
    }
}
