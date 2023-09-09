//
//  AddViewModel.swift
//  App184
//
//  Created by Вячеслав on 9/4/23.
//

import SwiftUI
import CoreData

final class AddViewModel: ObservableObject {
    
    @Published var title: String = ""
    @Published var caption: String = ""
    
    func addPost(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "AddModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let trans = NSEntityDescription.insertNewObject(forEntityName: "AddModel", into: context) as! AddModel
        
        trans.title = title
        trans.caption = caption
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
}
