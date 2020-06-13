//
//  Network.swift
//  Github-Intergration
//
//  Created by devTmg on 6/12/20.
//  Copyright © 2020 devTmg. All rights reserved.
//

import CoreData
import Apollo

let GitAccessToken = "fb469c6414293697a21b3cf25b0f42db42b33446"
let GitHubUrl = "https://api.github.com/graphql"

class Network {
    static let shared = Network()
    
    lazy var apollo : ApolloClient = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Authorization": "Bearer \(GitAccessToken)"]
        let url = URL(string: GitHubUrl)!
        return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, client: URLSessionClient(sessionConfiguration: configuration, callbackQueue: nil)))
    }()
    
    func decode<T: Decodable>(data: [String : Any], type: T.Type) -> T? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: data)
            return try JSONDecoder().decode(T.self, from: jsonData)
        } catch let error {
            return print(error) as? T
        }
    }
}
