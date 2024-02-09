//
//  PhotosModel.swift
//  HW01Swift
//
//  Created by Kirill on 31/01/2024.
//  Copyright © 2024 Kirill. All rights reserved.
//

//import Foundation

struct PhotosModel: Decodable {
    let response: PhotosItems
}

struct PhotosItems: Decodable {
    let items: [Photo]
}

struct Photo: Decodable {
    let sizes: [PhotoSizes]
}

struct PhotoSizes: Decodable {
    let width: Int
    let height: Int
    let url: String
}
