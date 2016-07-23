//
//  ViewController.swift
//  jsonData
//
//  Created by Kaylan Smith on 7/20/16.
//  Copyright © 2016 Kaylan Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = NSURL(string: "https://freegeoip.net/json/")!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
        
            // convert JSON into readable content
            if let urlContent = data {
            
                do {
                    
                let jsonResult = try NSJSONSerialization.JSONObjectWithData(urlContent, options: NSJSONReadingOptions.MutableContainers)
                    
                    // need to use if let and unwrap so this value is not optional
                    print(jsonResult["city"])
                
                } catch {
                
                    print ("JSON serialization failed")
                
                }
                
            }
        
        }
        
        task.resume()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

