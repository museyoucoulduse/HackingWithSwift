//
//  Person.swift
//  HWS-10
//
//  Created by Szymon Blaszczynski on 28/05/16.
//  Copyright © 2016 Szymon Blaszczynski. All rights reserved.
//

import UIKit

class Person: NSObject, NSCoding {
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
    
    var name: String
    var image: String
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("name") as! String
        image = aDecoder.decodeObjectForKey("image") as! String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(image, forKey: "image")
    }
}
