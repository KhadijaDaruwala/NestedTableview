//
//  CommetnObject.swift
//  nFormation
//
//  Created by webwerks on 30/06/20.
//  Copyright © 2020 Khadija Daruwala. All rights reserved.
//

import Foundation

class CommetnObject {

    var comment:String?
    var replies:[String]?
    var isExpanded = false
    init(commetn:[String: Any]?) {
        self.comment =  commetn?["comment"] as? String
        self.replies = []
        if let replies = commetn?["replies"] as? [String] {
            for reply in replies {
                self.replies?.append(reply)
            }
        }
    }
}
