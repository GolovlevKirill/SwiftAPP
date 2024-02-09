//
//  GroupsDate+CoreDataProperties.swift
//  HW01Swift
//
//  Created by Kirill on 09/02/2024.
//  Copyright © 2024 Kirill. All rights reserved.
//

import Foundation
import CoreData


extension GroupsDate {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GroupsDate> {
        return NSFetchRequest<GroupsDate>(entityName: "GroupsDate")
    }

    @NSManaged public var date: Date?

}

extension GroupsDate : Identifiable {

}
