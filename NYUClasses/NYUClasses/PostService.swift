//
//  PostService.swift
//  NYUClasses
//
//  Created by mAYUR on 11/16/14.
//  Copyright (c) 2014 theswiftproject. All rights reserved.
//

import Foundation


class PostService {
    var settings:AppConstants!
    
    init() {
        settings = AppConstants();
    }
    
    func getStudent(NetID:String) -> NSDictionary {
        //println("get Student data")
        
        var viewStudent = settings.viewStudent
            viewStudent = viewStudent.stringByReplacingOccurrencesOfString("$", withString: NetID)
        
        return JSONParseDictionary(viewStudent)
    }
    
    func JSONParseDictionary(jsonString:String) -> NSDictionary {
        var data = NSURL(string: jsonString)
        var error:NSError?

        if let response = NSJSONSerialization.JSONObjectWithData(NSData(contentsOfURL: data!)!, options: NSJSONReadingOptions(0), error: nil) as? NSDictionary {
                return response
            }
        return [String: AnyObject]()

    }
    
}
