//
//  Groups+CoreDataProperties.swift
//  HW01Swift
//
//  Created by Лариса on 09/02/2024.
//  Copyright © 2024 Kirill. All rights reserved.
//


import Foundation
import CoreData


extension Groups {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Groups> {
        return NSFetchRequest<Groups>(entityName: "Groups")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var descr: String?
    @NSManaged public var photo: String?

}

extension Groups : Identifiable {

}
