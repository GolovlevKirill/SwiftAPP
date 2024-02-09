//
//  FriendsDate+CoreDataProperties.swift
//  HW01Swift
//
//  Created by Kirill on 09/02/2024.
//  Copyright © 2024 Kirill. All rights reserved.
//


import Foundation
import CoreData


extension FriendsDate {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FriendsDate> {
        return NSFetchRequest<FriendsDate>(entityName: "FriendsDate")
    }

    @NSManaged public var date: Date?

}

extension FriendsDate : Identifiable {

}
