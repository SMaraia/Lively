//
//  FileHelperFunctions.swift
//  iOSChallenge
//
//  Created by Sean Maraia on 1/29/16.
//  Copyright © 2016 Sean Maraia. All rights reserved.
//

import Foundation
import UIKit

func DocumentsDirectory() -> String{
    return NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).first! as String
}

func TempDirectory() -> String{
    return NSTemporaryDirectory()
}

func FilePathInDocumentsDirectory(filename: String) -> String{
    return (DocumentsDirectory() as NSString).stringByAppendingPathComponent(filename)
}

func fileExists(path : String) -> Bool{
    return NSFileManager.defaultManager().fileExistsAtPath(path)
}