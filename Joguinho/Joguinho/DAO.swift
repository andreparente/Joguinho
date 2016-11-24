//
//  DAO.swift
//  Joguinho
//
//  Created by Andre Machado Parente on 10/26/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DAO {
    
    var error:NSError?
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func fetchClothes()
    {
        
    }
    
    func fetchPieces()
    {
        
    }
    
    func savePlanets(planets: [Planet]) {
        
        let context = getContext()
        
        //retrieve the entity that we just created
        let entity =  NSEntityDescription.entity(forEntityName: "PlanetCD", in: context)
        
        for planet in planets {
            
            let managed = NSManagedObject(entity: entity!, insertInto: context)
            //set the entity values
            managed.setValue(planet.name.rawValue, forKey: "name")
            managed.setValue(planet.gravity, forKey: "gravity")
            managed.setValue(planet.index.rawValue, forKey: "index")
            managed.setValue(planet.info, forKey: "info")
            managed.setValue(planet.shortInfo, forKey: "shortInfo")
            managed.setValue(planet.type.rawValue, forKey: "type")
            
            //save the object
            do {
                try context.save()
                print("saved \(planet.name)")
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
                break
            } catch {
                break
            }
        }
    }
    
    func getPlanets() -> [Planet] {
            
            var planetsAux: [Planet] = []
            //create a fetch request, telling it about the entity
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PlanetCD")
            do {
                //go get the results
                let searchResults = try getContext().fetch(fetchRequest)
                
                //I like to check the size of the returned results!
                print ("num of planets = \(searchResults.count)")

                //You need to convert to NSManagedObject to use 'for' loops
                for planet in searchResults as! [NSManagedObject] {

                    var type: PlanetType
                    var planetAux: Planet
                    
                    switch planet.value(forKey: "type") as! String {
                    case "gaseous":
                        type = PlanetType.gaseous
                        break
                    default:
                        type = PlanetType.terrestrial
                        break
                    }
                    
                    planetAux = Planet(name: PlanetName(rawValue: planet.value(forKey: "name") as! String)!, gravity: planet.value(forKey: "gravity") as! Double, type: type, index: planet.value(forKey: "index") as! PlanetIndex)
                    
                    planetsAux.append(planetAux)
                }
            } catch {
                print("Error with request: \(error)")
            }
            return planetsAux
    }
}
