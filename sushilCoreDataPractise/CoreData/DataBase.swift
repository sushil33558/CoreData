//
//  DataBase.swift
//  sushilCoreDataPractise
//
//  Created by Divya Pegwal on 9/26/22.
//

import Foundation
import CoreData
import UIKit
class DataBase{
    //MARK: - variables
    //------------------
    static let shared = DataBase()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    //MARK: - func
    //------------------
    func saveData(object:[String:Any]){
        let employee = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context!) as! Employee
        employee.empName = object["Name"] as? String
        employee.empAge = object["Age"] as? String
        employee.empRole = object["role"] as? String
        employee.company = object["company"] as? String
        employee.empProfile = object["profile"] as? Data
        do{
            try context?.save()
        }catch{
            print("data not saved")
        }
    }
    func fetchData()->[Employee]{
        var employee = [Employee]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Employee" )
        do{
            employee = try context?.fetch(fetchRequest) as! [Employee]
        }catch{
            print("Can not get data.")
        }
        return employee
    }
    //MARK: - removeData
    //-------------------
    func removeData(index:Int)->[Employee]{
        var employee = fetchData()
        context?.delete(employee[index])
        employee.remove(at: index)
        do{
            try context?.save()
        }catch{
            print("data does not romoved some error i got!")
        }
        return employee
    }
}
