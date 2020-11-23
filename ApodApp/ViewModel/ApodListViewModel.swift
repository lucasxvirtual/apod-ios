//
//  ApodListViewModel.swift
//  ApodApp
//
//  Created by Lucas Silva on 22/11/20.
//  Copyright © 2020 Lucas Silva. All rights reserved.
//

import Foundation
import Combine

class ApodListViewModel: ObservableObject {
    private let url = "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&start_date=2020-11-05&end_date=2020-11-10"
    private var task: AnyCancellable?
    
    @Published var apods: [Apod] = []
    
    func fetchApods() {
        task = URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
            .map { $0.data }
            .decode(type: [Apod].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: \ApodListViewModel.apods, on: self)
    }
}
