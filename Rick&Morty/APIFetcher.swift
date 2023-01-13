//
//  APIFetcher.swift
//  Rick&Morty
//
//  Created by Default on 1/13/23.
//

import Foundation
import SwiftUI
import Combine

class ApiFetcher: ObservableObject {
    
    @Published var planets: [Planet] = []
    
    init() {
        fetchCharactersFromApi()
    }
    
    var cancellables = Set<AnyCancellable>()
    
    func fetchCharactersFromApi() {
        
        guard let url = URL(string: "https://swapi.dev/api/planets") else {return}
  //David Method
/*
//        let url = URL(string: endpoint)!
//        let request = URLRequest(url: url)
//        let rawResponse = try await URLSession.shared.dataTask(with: request)
//        let response = try JSONDecoder().decode(APIData.self, from: rawResponse)
//
//        return response
        
//        1. create the publisher
//        2. suscribe to the publisher on a background Thread
//        3. receive on main Thread
//        4. tryMap (check that the data is good)
//        5. decode (decode data into PostModels)
        //6. sink (put the item into our app)
        //7. store (cancel subscription
*/

        URLSession.shared.dataTaskPublisher(for: url)
//            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap { (data, response) -> Data in
               guard
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                   throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: APIData.self , decoder: JSONDecoder())
            .sink { (completion) in
                print("Completion: \(completion)")
            } receiveValue: { [weak self] (returnedData) in
                self?.planets = returnedData.results
                
            }
            .store(in: &cancellables)
           }
}
