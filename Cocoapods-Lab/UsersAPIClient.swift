//
//  UsersAPIClient.swift
//  Cocoapods-Lab
//
//  Created by Lilia Yudina on 3/2/20.
//  Copyright © 2020 Lilia Yudina. All rights reserved.
//

import Foundation
import Alamofire

struct UsersAPIClient {
    static func fetchUsers(completion: @escaping (AFResult<User>) -> ()) {
        let endpointURL = "https://randomuser.me/api/"
        
        guard let url = URL(string: endpointURL) else {
          return
        }
        
        AF.request(url).response { (response) in
               if let error = response.error {
                   completion(.failure(error))
               } else if let data = response.data {
                   do {
                       let results = try JSONDecoder().decode(ResultsWrapper.self, from: data)
                    if let user = results.results.first {
                           completion(.success(user))
                       }
                   } catch {
                      // completion(.failure(AFError))
                       print("couldn't find user")
                   }
               }
           }
    }
}
