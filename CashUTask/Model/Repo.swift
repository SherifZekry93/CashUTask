//
//  Repo.swift
//  CashUTask
//
//  Created by Sherif  Wagih on 6/20/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import Foundation
struct Repo:Codable
{
   
    
    let id:Int
    
    let name:String
    
    let description:String?
    
    let language:String?
    
    let stargazers_count:Int
    
    let archived: Bool
   
}
