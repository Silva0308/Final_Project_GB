//
//  Copyright.swift
//  AirportTimetable
//
//  Created by MacBook Pro on 14/09/23.
//

import Foundation

struct Copyright: Decodable {
    let copyright: CopyrightInformation
}

struct CopyrightInformation: Decodable {
    let text: String
    let url: String
}
