//
//  DbController.swift
//  NYUClasses
//
//  Created by mAYUR on 11/9/14.
//  Copyright (c) 2014 theswiftproject. All rights reserved.
//

import Foundation



class DbController {
    
    let service:PostService = PostService()
    var status:Bool
    var studentInfo: NSDictionary!
    
    init () {
        self.status = false
        self.studentInfo = nil
    }
    
    func LoginValidation(NetID:String) -> Bool {
        var response = self.service.getStudent(NetID)
        
        var id = response["name"] as? NSString
        if id != nil  {
            self.status = false
        } else {
            self.studentInfo = ((response as NSDictionary)["sTUDENT"] as NSDictionary)["STUDENT"]! as NSDictionary
            self.status = true
        }
        return self.status
    }
   
    func getStudentName() -> String {
        var First_Name = self.studentInfo["First_Name"] as String
        var Last_Name = self.studentInfo["Last_Name"] as String
        return First_Name + " " + Last_Name
    }
    
}
