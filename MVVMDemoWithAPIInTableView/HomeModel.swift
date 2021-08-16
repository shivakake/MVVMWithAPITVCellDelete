//
//  HomeModel.swift
//  MVVMDemoWithAPIInTableView
//
//  Created by PGK Shiva Kumar on 16/08/21.
//

//https://n6lih99291.execute-api.ap-south-1.amazonaws.com/dev/menu

import Foundation
// MARK: - HomeModel
struct HomeModel: Codable {
    let statusCode: Int?
    var data: DataClass?
}
// MARK: - DataClass
struct DataClass: Codable {
    let total: Int?
    var data: [MovieData]?
}
// MARK: - Datum
struct MovieData: Codable {
    let id: Int?
    let friendlyURL, seoDescription, title, type: String?
    let imagery: Imagery?
    enum CodingKeys: String, CodingKey {
        case id
        case friendlyURL = "friendly_url"
        case seoDescription = "seo_description"
        case title, type, imagery
    }
}
// MARK: - Imagery
struct Imagery: Codable {
    let mobileMenu, menuPosterImage, mobileMenuPosterImage: String?
    enum CodingKeys: String, CodingKey {
        case mobileMenu = "mobile-menu"
        case menuPosterImage = "menu-poster-image"
        case mobileMenuPosterImage = "mobile-menu-poster-image"
    }
}
