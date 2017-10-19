//
//  Contact.swift
//  DemoNavigationBar
//
//  Created by ChesterGuo on 2017/6/22.
//  Copyright © 2017年 xinyuantec. All rights reserved.
//

import UIKit

class Contact: NSObject {
    var name : String?
    var mobile : String?{
        didSet{
            if mobile?.lengthOfBytes(using: .utf8) == 11 {
                mobileString = mobile
                var spaceIndex = mobile?.index(mobile!.startIndex, offsetBy: 3)
                mobileString?.insert(" ", at: spaceIndex!)
                spaceIndex = mobile?.index(mobile!.endIndex, offsetBy: -3)
                mobileString?.insert(" ", at: spaceIndex!)
            }
        }
    }
    var address : String?
    var email : String?
    var mobileString : String?
}
