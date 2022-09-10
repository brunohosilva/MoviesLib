//
//  ViewController+Context.swift
//  MoviesLib
//
//  Created by Bruno Oliveira on 08/09/22.
//

import Foundation
import UIKit
import CoreData

extension UIViewController {
    var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
