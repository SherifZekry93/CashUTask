//
//  Service.swift
//  CashUTask
//
//  Created by Sherif  Wagih on 6/20/19.
//  Copyright © 2019 Sherif  Wagih. All rights reserved.
//

import Foundation
import Alamofire
class Service {
//        static let shared = Service()//singleton
        
        func fetchGenericJSONData<T:Decodable>(urlString:String,completion:@escaping (T?,Error?) -> ())
        {
            guard let actual_url = URL(string: urlString) else {return}
            Alamofire.request(actual_url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
                do
                {
                    if let data = response.data
                    {
                        let feeds = try JSONDecoder().decode(T.self, from: data)
                        if response.result.isSuccess && response.error == nil
                        {
                            completion(feeds,nil)
                        }
                        else
                        {
                            completion(nil,response.error)
                        }
                    }
                }
                catch let err
                {
                    completion(nil,err)
                }
            }
        }
    }
