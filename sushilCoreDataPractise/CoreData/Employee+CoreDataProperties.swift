//
//  Employee+CoreDataProperties.swift
//  sushilCoreDataPractise
//
//  Created by Divya Pegwal on 9/26/22.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var empName: String?
    @NSManaged public var empAge: String?
    @NSManaged public var empProfile: Data?
    @NSManaged public var empRole: String?
    @NSManaged public var company: String?

}

extension Employee : Identifiable {

}
