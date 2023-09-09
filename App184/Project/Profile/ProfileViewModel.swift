//
//  ProfileViewModel.swift
//  App184
//
//  Created by Вячеслав on 9/4/23.
//

import SwiftUI
import CoreData

final class ProfileViewModel: ObservableObject {
    
    @Published var tips: [AddModel] = []
    

    @Published var isMenu: Bool = false
    @Published var isSettings: Bool = false
    
    func fetchTips() {
        
        CoreDataStack.shared.modelName = "AddModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<AddModel>(entityName: "AddModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.tips = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.tips = []
        }
    }
}
    
