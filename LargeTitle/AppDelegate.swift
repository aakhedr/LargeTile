//
//  AppDelegate.swift
//  LargeTitle
//
//  Created by Ahmed Khedr on 9/25/17.
//  Copyright © 2017 Ahmed Khedr. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let splitViewController = window!.rootViewController as! UISplitViewController
        let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController
        navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        splitViewController.delegate = self
        return true
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
    }

    // MARK: - Split view

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController else { return false }
        if topAsDetailController.detailItem == nil {
            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
            return true
        }
        return false
    }

    func splitViewController(_ splitViewController: UISplitViewController, showDetail vc: UIViewController, sender: Any?) -> Bool {
        if splitViewController.isCollapsed, let navController = vc as? UINavigationController {
            if let detailVC = navController.topViewController {
                splitViewController.showDetailViewController(detailVC, sender: sender)
                return true
            }
        }
        return false
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, separateSecondaryFrom primaryViewController: UIViewController) -> UIViewController? {
        let controllers = splitViewController.viewControllers
        
        if let navController = controllers[controllers.count - 1] as? UINavigationController {
            if let detailViewController = navController.topViewController as? DetailViewController {
                navController.popViewController(animated: false)
                let detailNavController = UINavigationController(rootViewController: detailViewController)
                if #available(iOS 11.0, *) {
                    detailNavController.navigationBar.prefersLargeTitles = true
                }
                return detailNavController
            }
            else if let _ = navController.topViewController as? MasterViewController {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if let detailNavController = storyboard.instantiateViewController(withIdentifier: "DetailNav") as? UINavigationController {
                    if let detailViewController = detailNavController.topViewController as? DetailViewController {
                        detailViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
                        detailViewController.navigationItem.leftItemsSupplementBackButton = true
                    }
                    return detailNavController
                }
            }
        }
        return nil
    }
    
}

