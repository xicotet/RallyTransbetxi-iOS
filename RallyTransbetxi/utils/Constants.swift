//
//  Constants.swift
//  RallyTransbetxi
//
//  Created by Pablo on 11/7/24.
//

import Foundation

struct Constants {
    static let BETXI_LOCATION = "39.927995,-0.198889"
    
    // Day of the event
    static let BEGINNING_DAY = 26
    static let BEGINNING_MONTH = 4
    static let BEGINNING_YEAR = 2025
    
    // Default number of elements to show in the home screen
    static let DEFAULT_NEWS = 2
    static let DEFAULT_WARNINGS = 1
    static let DEFAULT_ACTIVITIES = 5
    
    // Categories API names
    static let SERIE = "Serie"
    static let PROTOTYPE = "Prototipo"
    static let AGRIA = "Agria"
    
    // Room storage
    static let DATABASE_NAME = "app_database"
    static let DEFAULT_THEME = "light"
    static let DEFAULT_PROFILE = "driving-car"
    static let DEFAULT_FONT_SIZE_FACTOR: Float = 1.0
    
    // OpenRouteService
    static let DIRECTIONS_BASE_URL = "https://api.openrouteservice.org/v2/"
    
    // Firebase storage
    static let DRIVERS_FOLDER = "drivers/"
    static let DRIVER_IMAGE_PREFIX = "driverImage"
    static let CODRIVER_IMAGE_PREFIX = "codriverImage"
    static let DRIVER_IMAGE_EXTENSION = ".png"
    
    static let TEAMS_FOLDER = "teams/"
    static let TEAM_IMAGE_PREFIX = "teamImage"
    static let TEAM_IMAGE_EXTENSION = ".jpg"
    
    static let SPONSORS_FOLDER = "sponsors/"
    static let SPONSORS_IMAGE_PREFIX = "sponsor"
    static let SPONSORS_IMAGE_EXTENSION = ".jpg"
    
    static let NEWS_FOLDER = "news/"
}
