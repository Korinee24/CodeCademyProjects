//
//  RandomUsersTests.swift
//  RandomUsersTests
//
//  Created by 김경완 on 8/8/24.
//

import XCTest
@testable import RandomUsers

class RandomUsersTests: XCTestCase {
  func testUserModel() throws {
    let jsonData = getTestJSONData()

    do {
      _ = try JSONDecoder().decode(Response.self, from: jsonData)
    }
    catch {
      print(error)
    }
  }

  private func getTestJSONData() -> Data {
    guard let path = Bundle.main.path(forResource: "randomUsers",
                                      ofType: "json") else {
      fatalError("randomUsers.json file not found")
    }
    let internalURL = URL(fileURLWithPath: path)
    return try! Data(contentsOf: internalURL)
  }
}
