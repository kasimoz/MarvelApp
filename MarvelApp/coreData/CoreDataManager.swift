//
//  CoreDataManager.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 10.10.2021.
//

import Foundation
import UIKit
import CoreData

final class CoreDataManager {
    lazy var persistentContainer : NSPersistentContainer = {
        return (UIApplication.shared.delegate as? AppDelegate)!.persistentContainer
    }()
    
    var moc : NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func saveCharacter(charater : MarvelCharacter){
        
        let character = NSEntityDescription.entity(forEntityName: "CharacterEntity", in: moc)!
        
        let characterObject = NSManagedObject(entity: character, insertInto: moc)
        
        characterObject.setValue(charater.id, forKey: "id")
        characterObject.setValue(charater.name, forKey: "name")
        characterObject.setValue(charater.description, forKey: "desc")
        characterObject.setValue(charater.thumbnail?.path, forKey: "path")
        characterObject.setValue(charater.thumbnail?.extension_, forKey: "ext")
        
        do {
            try moc.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func fetchCharacters() -> [NSManagedObject] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CharacterEntity")
        
        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "name", ascending: true)]
        
        do {
            let result = try moc.fetch(fetchRequest)
            return result as! [NSManagedObject]
        } catch {
            print("Failed")
            return []
        }
    }
    
    func removeCharacter(id : Int){
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CharacterEntity")
        fetchRequest.predicate = NSPredicate(format: "id = %d", id)
        do
        {
            if let result = try? moc.fetch(fetchRequest){
                for object in result {
                    moc.delete(object as! NSManagedObject)
                }
            }
        }
    }
}
