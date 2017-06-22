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
                let start = mobile?.index(mobile!.startIndex, offsetBy: 3)
                let end = mobile?.index(mobile!.endIndex, offsetBy: -4)
                mobileString = mobile!.substring(to: start!) + "  " + mobile!.substring(with: start!..<end!) + "  " + mobile!.substring(from: end!)
            }
        }
    }
    var address : String?
    var email : String?
    var mobileString : String?
}
