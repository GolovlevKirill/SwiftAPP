//
//  Friends+CoreDataProperties.swift
//  HW01Swift
//
//  Created by Kirill on 09/02/2024.
//  Copyright © 2024 Kirill. All rights reserved.
//

import Foundation
import CoreData


extension Friends {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friends> {
        return NSFetchRequest<Friends>(entityName: "FriendsCD")
    }

    @NSManaged public var id: Int64
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var online: Int64
    @NSManaged public var photo: String?

}

extension Friends : Identifiable {

}
