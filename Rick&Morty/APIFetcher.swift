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

        URLSession.shared.dataTaskPublisher(for: url)
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
