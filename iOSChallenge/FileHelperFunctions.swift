//
//  FileHelperFunctions.swift
//  iOSChallenge
//
//  Created by Sean Maraia on 1/29/16.
//  Copyright © 2016 Sean Maraia. All rights reserved.
//

import Foundation
import UIKit
import CloudKit

let SAVED_FILE_NAME = "Trip"
let SAVED_FILE_FILETYPE = ".archive"
let cloudIdentifier:String! = "ZK6B9E922P.me.SeanMaraia.LivelyiOS"
let privateDB = CKContainer.defaultContainer().privateCloudDatabase
let DB = CKContainer(identifier: "iCloud.me.SeanMaraia.LivelyiOS")


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
func saveData() {
    //saves favorites object, including array of favorite Games, to documents folder
    
    
    //let tripRecord = CKRecord(recordType: "Trip", recordID: tripID)
    for trip: Trip in trips.trips{
        let tripID = CKRecordID(recordName: "\(SAVED_FILE_NAME)\(trip.name)")
        let convertedTitle: String = trip.name.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        let pathToFile = FilePathInDocumentsDirectory("\(SAVED_FILE_NAME)\(convertedTitle))\(SAVED_FILE_FILETYPE)")
        _ = NSKeyedArchiver.archiveRootObject(trip, toFile: pathToFile)
        //let fileURL = NSURL(fileURLWithPath: pathToFile)
        /*let tripConverted = CKRecord(recordType: "Trip", recordID: tripID)
        tripConverted["title"] = trip.name
        tripConverted["location"] = trip.location
        var images : [CKAsset] = []
        var entries : [String] = []
        for moment in trip.moments {
            entries.append(moment.journalLog)
            images.append(CKAsset(fileURL: moment.image))
        }

        tripConverted["images"] = images
        tripConverted["entires"] = entries
        DB.privateCloudDatabase.saveRecord(tripConverted) { savedRecord, error in
            print("Saving to Cloud Failed, Reason: \(error?.localizedDescription)")

        }*/
        
    }
}

func getDataFromCloud() {
    
}
