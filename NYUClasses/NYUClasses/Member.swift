//
//  Member.swift
//  NYUClasses
//
//  Created by mAYUR on 12/2/14.
//  Copyright (c) 2014 theswiftproject. All rights reserved.
//

import Foundation

class Member {
    let imageName:String?
    let course_name:String?
    let prof_name:String?
    let prof_email:String?
    let about:String?
    let time:String?
    
    init(dictionary:NSDictionary) {
        imageName = dictionary["image"]    as? String
        course_name  = dictionary["name"]     as? String
        prof_name     = dictionary["prof_name"]    as? String
        prof_email  = dictionary["prof_email"] as? String
        time       = dictionary["timing"]      as? String
        
        // fixup the about text to add newlines
        var unescapedAbout = dictionary["about"] as String
        about = unescapedAbout.stringByReplacingOccurrencesOfString("\\n", withString:"\n", options:nil, range:nil)
    }
    
    class func loadMembersFromFile(path:String) -> [Member]
    {
        var members:[Member] = []
        
        var error:NSError? = nil
        if let data = NSData(contentsOfFile: path, options:nil, error:&error) as NSData? {
            if let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error:&error) as? NSDictionary {
                if let team = json["team"] as? NSArray {
                    for obj:AnyObject in team {
                        let memberDictionary = obj as NSDictionary
                        let member = Member(dictionary: memberDictionary)
                        members.append(member)
                    }
                }
            }
        }
        return members
    }
}
