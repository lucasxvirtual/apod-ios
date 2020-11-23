//
//  ApodListView.swift
//  Apod
//
//  Created by Lucas Silva on 22/11/20.
//  Copyright © 2020 Lucas Silva. All rights reserved.
//

import SwiftUI

struct ApodListView: View {
    @ObservedObject var viewModel = ApodListViewModel()
    
    init() {
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.apods) { apod in
                ApodView(apod: apod)
            }
            .environment(\.defaultMinListRowHeight, 200)
            .navigationBarTitle("Apods")
                .onAppear {
                    self.viewModel.fetchApods()
            }
        }
    }
}

struct ApodListView_Previews: PreviewProvider {
    static var previews: some View {
        ApodListView()
    }
}
