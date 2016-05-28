//
//  Person.swift
//  HWS-10
//
//  Created by Szymon Blaszczynski on 28/05/16.
//  Copyright © 2016 Szymon Blaszczynski. All rights reserved.
//

import UIKit

class Person: NSObject {
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
    
    var name: String
    var image: String
}
