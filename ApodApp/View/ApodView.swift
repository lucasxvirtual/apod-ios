//
//  ApodView.swift
//  Apod
//
//  Created by Lucas Silva on 22/11/20.
//  Copyright © 2020 Lucas Silva. All rights reserved.
//

import SwiftUI

struct ApodView: View {
    
    private let apod: Apod
    @ObservedObject var imageLoader: ImageLoaderAndCache
    
    
    init(apod: Apod) {
        self.apod = apod
        imageLoader = ImageLoaderAndCache(imageURL: apod.url)
    }
    
    var body: some View {
        GeometryReader { geometryProxy in
            ZStack(alignment: .bottomTrailing) {
                Image(uiImage: UIImage(data: self.imageLoader.imageData) ?? UIImage())
                    .resizable()
                    .frame(width: geometryProxy.size.width, height: 200)
                Text(self.apod.formattedDate())
                    .foregroundColor(Color.white)
                    .padding(10)
                    .background(Color.black)
            }
            .background(Color.black)
        }
    }
}

struct ApodView_Previews: PreviewProvider {
    static var previews: some View {
        let apod = Apod(date: "yyyy-MM-dd", explanation: "test", mediaType: "image", title: "test", url: "test", hdUrl: "test")
        return ApodView(apod: apod)
    }
}
