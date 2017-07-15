//
//  Request.swift
//  HackLinkedIn
//
//  Created by Kashish Goel on 2017-07-15.
//  Copyright © 2017 Kashish Goel. All rights reserved.
//

import Foundation

class Request {
    var description:String?
    var image:String?
    var price:Int?
    var makePublic:Bool?
    var tags:[String]?
    var trawl:Bool?
    
    init(requestDictionary:Dictionary<String,AnyObject>) {
        if
            let description = requestDictionary[LocalizedText.descriptionKey] as? String,
            let image = requestDictionary[LocalizedText.imageUrlKey] as? String,
            let price = requestDictionary[LocalizedText.priceKey] as? Int,
            let makePublic = requestDictionary[LocalizedText.makePublicKey] as? Bool,
            let tags = requestDictionary[LocalizedText.tagsKey] as? [String],
            let trawl = requestDictionary[LocalizedText.trawl] as? Bool {
                    self.description = description
                    self.image = image
                    self.price = price
                    self.makePublic = makePublic
                    self.tags = tags
                    self.trawl = trawl
        }

    }
}
