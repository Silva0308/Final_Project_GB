//
//  Schedule.swift
//  AirportTimetable
//
//  Created by MacBook Pro on 14/09/23.
//

import Foundation

/// структура для декодирования JSON ответа расписания

struct Schedule: Decodable {
    let schedule: [ScheduleInformation]
}

struct ScheduleInformation: Decodable {
    let thread: Thread
    let departure: String?
    let arrival: String?
}

struct Thread: Decodable {
    let number: String
    let title: String
    let vehicle: String?
}
