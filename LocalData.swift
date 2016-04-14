//
//  LocalData.swift
//  αBaro
//
//  Created by Situo Meng on 4/10/16.
//  Copyright © 2016 Ethereo. All rights reserved.
//

import Foundation

class LocalData: NSObject, NSCoding {
    
    var name: String
    var coinNumber: Int
    var currentMission: String
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("LocalData")
    
    struct PropertyKey {
        
        static let nameKey = "name"
        static let coinNumberKey = "coinNumber"
        static let currentMissionKey = "currentMission"
    }
    
    
    init?(name: String, coinNumber: Int, currentMission: String) {
        // Initialize stored properties.
        self.name = name
        self.coinNumber = coinNumber
        self.currentMission = currentMission
        
        super.init()
        
        // Initialization should fail if there is no name or if the rating is negative.
        
    }
 
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeInteger(coinNumber, forKey: PropertyKey.coinNumberKey)
        aCoder.encodeObject(currentMission, forKey: PropertyKey.currentMissionKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        
        // Because photo is an optional property of Meal, use conditional cast.
        let coinNumber = aDecoder.decodeIntegerForKey(PropertyKey.coinNumberKey)
        
        let currentMission = aDecoder.decodeObjectForKey(PropertyKey.currentMissionKey) as! String
        
        // Must call designated initializer.
        self.init(name:name, coinNumber: coinNumber, currentMission: currentMission)
    }
    
}
