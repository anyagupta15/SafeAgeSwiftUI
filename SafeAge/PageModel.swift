//
//  PageModel.swift
//  SafeAge
//
//  Created by user1 on 15/01/24.
//

import Foundation

struct Page: Identifiable , Equatable{
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int
    
    static var samplePage = Page(name: "Title Example", description: "This is a sample description for the purpose of debugging", imageUrl: "lab book", tag: 0)
    
    static var samplePages: [Page] = [
    Page(name: "Welcome to SafeAge", description: "The best app to get alerts and book appointments", imageUrl: "frontscreen", tag: 0),
    Page(name: "Book Lab Appointments", description: "Easy to book lab appointments and provides alerts to book them", imageUrl: "lab book", tag: 1),
    Page(name: "Get Alerts", description: "Provides alerts , with options to book lab appointment , call neighbor or call an ambulance", imageUrl: "alert", tag: 2),
    ]
}
