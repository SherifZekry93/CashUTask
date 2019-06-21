//
//  Alamofire.swift
//  CashUTask
//
//  Created by Sherif  Wagih on 6/21/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import Alamofire
class Connectivity {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
