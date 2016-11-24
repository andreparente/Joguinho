//
//  AppDelegate.swift
//  Joguinho
//
//  Created by Andre Machado Parente on 10/21/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import UIKit
import CoreData


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if userDefaults.value(forKey: "lastLevel") == nil {
            userDefaults.set(1, forKey: "lastLevel")
            userDefaults.set(0, forKey: "coinsBalance")
            planetsGlobal = self.getArrayPlanets()
            DAO().savePlanets(planets: planetsGlobal)
        } else {
            planetsGlobal = DAO().getPlanets()
        }
        
        if userDefaults.value(forKey: "levels") == nil {
        levels.removeAll()
           for _ in 0...7 {
            levels.append(["lock","lock","lock","lock","lock","lock","lock","lock"])
         }
           
            levels[0][0] = "1"
            
            print("\(levels) \n")
            
            userDefaults.set(levels, forKey: "levels")
        }
        
        return true
    }
    
    func getArrayPlanets() -> [Planet] {
        
        var planetsAux: [Planet]
        var neptune,uranus,saturn,jupiter,mars,earth,venus,mercury: Planet
        
        neptune = Planet(name: PlanetName.Neptune, gravity: 0, type: PlanetType.gaseous, index: PlanetIndex.Neptune)
        neptune.info = "texto falando sobre netuno"
        neptune.shortInfo = "texto curto sobre netuno"
        
        uranus = Planet(name: PlanetName.Uranus, gravity: 0, type: PlanetType.gaseous, index: PlanetIndex.Uranus)
        uranus.info = "texto falando sobre Uranus"
        uranus.shortInfo = "texto curto sobre Uranus"
        
        saturn = Planet(name: PlanetName.Saturn, gravity: 0, type: PlanetType.gaseous, index: PlanetIndex.Saturn)
        saturn.info = "texto falando sobre Saturn"
        saturn.shortInfo = "texto curto sobre Saturn"
        
        jupiter = Planet(name: PlanetName.Jupiter, gravity: 0, type: PlanetType.gaseous, index: PlanetIndex.Jupiter)
        jupiter.info = "texto falando sobre Jupiter"
        jupiter.shortInfo = "texto curto sobre Jupiter"
        
        mars = Planet(name: PlanetName.Mars, gravity: 0, type: PlanetType.gaseous, index: PlanetIndex.Mars)
        mars.info = "texto falando sobre Mars"
        mars.shortInfo = "texto curto sobre Mars"
        
        earth = Planet(name: PlanetName.Earth, gravity: 0, type: PlanetType.gaseous, index: PlanetIndex.Earth)
        earth.info = "texto falando sobre Earth"
        earth.shortInfo = "texto curto sobre Earth"
        
        venus = Planet(name: PlanetName.Venus, gravity: 0, type: PlanetType.gaseous, index: PlanetIndex.Venus)
        venus.info = "texto falando sobre Venus"
        venus.shortInfo = "texto curto sobre Venus"
        
        mercury = Planet(name: PlanetName.Mercury, gravity: 0, type: PlanetType.gaseous, index: PlanetIndex.Mercury)
        mercury.info = "texto falando sobre mercury"
        mercury.shortInfo = "texto curto sobre mercury"
        
        planetsAux = [neptune,uranus,saturn,jupiter,mars,earth,venus,mercury]
        
        return planetsAux
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        saveContext()
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
