//
//  ConfigurationSettings.swift
//  pateluRemoteControl_III
//
//  Created by Urvi Patel on 2/13/16.
//  Copyright © 2016 Urvi Patel. All rights reserved.
//

import Foundation

class ConfigurationSettings {
    var favoriteLabel: String = "CBS";
    var favoriteIndex: Int = 0;
    var favoriteChannel: String = "2";
    
//    init(fLabel: String, fIndex: Int, fChannel: String) {
//        favoriteLabel = fLabel;
//        favoriteIndex = fIndex;
//        favoriteChannel = fChannel;
//    }
    
    static let sharedInstance = ConfigurationSettings();
}