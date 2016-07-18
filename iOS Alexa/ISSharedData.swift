//
//  ISSharedData.swift
//  iOS Alexa
//
//  Created by Chintan Prajapati on 24/05/16.
//  Copyright © 2016 Chintan. All rights reserved.
//

import Foundation

public class ISSharedData : NSObject {
    public static let sharedInstance = ISSharedData()
    
    public var accessToken:String?
}