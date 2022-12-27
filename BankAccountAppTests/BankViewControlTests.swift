//
//  BankViewControlTests.swift
//  BankAccountAppTests
//
//  Created by Michelle Grover on 12/26/22.
//

import XCTest
@testable import BankAccountApp

final class BankViewControlTests: XCTestCase {
    
    var bankVC:BankViewController!

    override func setUpWithError() throws {
        bankVC = BankViewController()
       
    }

    override func tearDownWithError() throws {
        bankVC = nil
    }
    
    func testCalculationOfSum() {
        XCTAssertEqual(4.60, bankVC.fetchSum(checkingValue: "2.35", savingsValue: "2.25"))
    }

    
}
