//
//  Place.swift
//  TestTask2-Corpus
//
//  Created by Tony on 17.07.22.
//

import Foundation

struct Place: Codable {
    let id: Int?
    let id_point: Int?
    let name: String?
    let text: String?
    let sound: String?
    let lang: Int?
    let last_edit_time: Int?
    let creation_date: String?
    let lat: Double?
    let lng: Double?
    let logo: String?
    let photo: String?
    let city_id: Int?
    let visible: Bool?
    let images: [String]?
    let tags: [Int]?
    let is_excursion: Bool?
    
    
//    init(name: String, lang: Int, logo: String, images: [String], visible: Bool, city_id: Int){
//        self.name = name
//        self.lang = lang
//        self.logo = logo
//        self.images = images
//        self.visible = visible
//        self.city_id = city_id
//    }
}
