//
//  SIXTTests.swift
//  SIXTTests
//
//  Created by Munachimso Ugorji on 24/05/2021.
//

import XCTest
@testable import SIXT

class SixtViewModelTests: XCTestCase {
    let viewModel = SixtViewModel(with: nil)
    
    func testGetCarsCount() {
        viewModel.updateCars(with: MockTestData.mockData)
        let count = viewModel.getCarsCount()
        
        XCTAssertEqual(count, 3)
    }
    
    func testGetCar() {
        viewModel.updateCars(with: MockTestData.mockData)
        let car1 = viewModel.getCar(index: 0)
        let car2 = viewModel.getCar(index: 1)
        let car3 = viewModel.getCar(index: 2)
        
        XCTAssertEqual(car1, MockTestData.mockData[0])
        XCTAssertEqual(car2, MockTestData.mockData[1])
        XCTAssertEqual(car3, MockTestData.mockData[2])
    }
    
    func testSetAnnotation() {
        viewModel.setAnnotation(from: MockTestData.mockData)
        let annotations = viewModel.getAnnotations()
        
        XCTAssertEqual(annotations.count, 3)
    }
    
    func testGetCoordinates() {
        viewModel.setAnnotation(from: MockTestData.mockData)
        let coordinates = viewModel.getCoordinates()
        
        XCTAssertEqual(coordinates.count, 3)
        
        XCTAssertEqual(coordinates[0].latitude, MockTestData.mockData[0].coordinates.latitude)
        XCTAssertEqual(coordinates[1].latitude, MockTestData.mockData[1].coordinates.latitude)
        XCTAssertEqual(coordinates[2].latitude, MockTestData.mockData[2].coordinates.latitude)
        
        XCTAssertEqual(coordinates[0].longitude, MockTestData.mockData[0].coordinates.longitude)
        XCTAssertEqual(coordinates[1].longitude, MockTestData.mockData[1].coordinates.longitude)
        XCTAssertEqual(coordinates[2].longitude, MockTestData.mockData[2].coordinates.longitude)
        
    }
    
    func testGetSixtCarsCellViewModel() {
        viewModel.updateCars(with: MockTestData.mockData)
        let carsCellModel1 = viewModel.getSixtCarsCellViewModel(index: 0)
        let carsCellModel2 = viewModel.getSixtCarsCellViewModel(index: 1)
        let carsCellModel3 = viewModel.getSixtCarsCellViewModel(index: 2)
        
        XCTAssertEqual(carsCellModel1.carImageUrl, MockTestData.mockData[0].carImageUrl)
        XCTAssertEqual(carsCellModel1.carName, MockTestData.mockData[0].name)
        XCTAssertEqual(carsCellModel1.carMake, MockTestData.mockData[0].make + " " + MockTestData.mockData[0].modelName)
        
        XCTAssertEqual(carsCellModel2.carImageUrl, MockTestData.mockData[1].carImageUrl)
        XCTAssertEqual(carsCellModel2.carName, MockTestData.mockData[1].name)
        XCTAssertEqual(carsCellModel2.carMake, MockTestData.mockData[1].make + " " + MockTestData.mockData[1].modelName)
        
        XCTAssertEqual(carsCellModel3.carImageUrl, MockTestData.mockData[2].carImageUrl)
        XCTAssertEqual(carsCellModel3.carName, MockTestData.mockData[2].name)
        XCTAssertEqual(carsCellModel3.carMake, MockTestData.mockData[2].make + " " + MockTestData.mockData[2].modelName)
        
    }
}
