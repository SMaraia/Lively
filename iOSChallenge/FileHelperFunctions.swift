//
//  FileHelperFunctions.swift
//  iOSChallenge
//
//  Created by Sean Maraia on 1/29/16.
//  Copyright © 2016 Sean Maraia. All rights reserved.
//

import Foundation
import UIKit

let SAVED_FILE_NAME = "Trips.archive"

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

// MARK: - Saving Data -
func saveData(){
    //saves favorites object, including array of favorite Games, to documents folder
    let pathToFile = FilePathInDocumentsDirectory(SAVED_FILE_NAME)
    _ = NSKeyedArchiver.archiveRootObject(trips, toFile: pathToFile)
}