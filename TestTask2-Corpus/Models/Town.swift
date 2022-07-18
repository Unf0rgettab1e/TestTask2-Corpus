//
//  Town.swift
//  TestTask2-Corpus
//
//  Created by Tony on 15.07.22.
//

import Foundation

class Town: Codable{
    let id: Int?
    let name : String?
    let logo : String?
    var places: [Place] = []
    
    init(id: Int?, name: String?, logo: String?) {
        self.name = name
        self.logo = logo
        self.id = id
//        self.places = places
    }

    func addPlace(place: Place){
        self.places.append(place)
    }
}
