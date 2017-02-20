//
//  ScreenSize.swift
//  Joguinho
//
//  Created by Andre Machado Parente on 16/11/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import Foundation
import UIKit


var screenSize: ScreenSize! = ScreenSize.init()

public class ScreenSize {
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
}
