//
//  ApiConnector.swift
//  Diabhelp
//
//  Created by Sumbers on 02/12/16.
//  Copyright © 2016 Sumbers. All rights reserved.
//

import Foundation

class ApiConnector{
    static let sharedInstance: ApiConnector = {
        let instance = ApiConnector()
        return instance
    }()
    
    let serverUrl = ""
    
    enum StateProject: String {
        case Dev = "http://dev.diabhelp.org/api/"
        case Prod = "https://diabhelp.org/api/"
    }
    
    func getServerUrl(state: StateProject) -> String {
        var url: String =  ""
        
        if (state == StateProject.Dev) {
            url = StateProject.Dev.rawValue
        }
        else {
            url = StateProject.Prod.rawValue
        }
        return url
    }
}
