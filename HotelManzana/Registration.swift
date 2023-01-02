//
//  Registration.swift
//  HotelManzana
//
//  Created by Christian Manzaraz on 02/01/2023.
//

import Foundation

struct Registration {
    var firstName: String,
        lastName: String,
        emailAddress: String
    
    var checkIn: Date,
        checkOut: Date,
        numberOfAdults: Int,
        numberOfChildren: Int
    
    var wifi: Bool,
        roomType: RoomType
}


struct RoomType: Equatable {
    var id: Int,
        name: String,
        shortName: String,
        price: Int
    
    // Equatable Protocol Implementation for RoomType
    static func ==(lhs: RoomType, rhs: RoomType) -> Bool {
        return lhs.id == rhs.id
    }
}
