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
        XCTAssertTrue(bankVC.fetchSum(updatedText: "0.01", checkingValue: "5.0", savingsValue: "0.2"))
    }

    
}
