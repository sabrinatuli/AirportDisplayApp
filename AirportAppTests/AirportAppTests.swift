//
//  AirportAppTests.swift
//  AirportAppTests
//
//  Created by Sabrina Tuli on 30/6/21.
//

import XCTest
@testable
import AirportApp
class AirportAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let manager = AirportManager()
        var testArray : [Airport] = []
        var unsortedArray : [Airport] = []
        var sortedArray : [Airport] = []
        var foundArr = [Airport]()
        testArray = [Airport(airportCode: "No Data", timezone: "No Data", city: "No Data", state: "No Data", airportName: "No Data")]
        
        //check data availability based on filename
        foundArr = manager.getAirportDatafromCSV(filename: "airport")
        XCTAssertNotEqual(foundArr, testArray,"Correct filename, Data available")
        foundArr = manager.getAirportDatafromCSV(filename: "airports")
        XCTAssertEqual(foundArr, testArray,"Wrong filename, No Data available")
        
        //check airport name sorting
        unsortedArray = [Airport(airportCode: "YAK", timezone: "America/Anchorage", city: "Yakutat", state: "Alaska", airportName: "Yakutat Airport"),Airport(airportCode: "ADK", timezone: "America/Adak", city: "Adak Island", state: "Alaska", airportName: "Adak Airport")]
        
        sortedArray = [Airport(airportCode: "ADK", timezone: "America/Adak", city: "Adak Island", state: "Alaska", airportName: "Adak Airport"),Airport(airportCode: "YAK", timezone: "America/Anchorage", city: "Yakutat", state: "Alaska", airportName: "Yakutat Airport")]
        foundArr = manager.SortedAirportName(airName:unsortedArray)
        XCTAssertEqual(foundArr, sortedArray,"Sorted correctly by Airport Name")
       
    

}

    

}
