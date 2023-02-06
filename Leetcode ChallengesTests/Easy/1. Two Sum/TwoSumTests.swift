// Copyright © 2023 Almost Engineer. All rights reserved.

import XCTest

// 1. Two Sum
/// Given an array of integers nums and an integer target, return indices of the two numbers such
/// that they add up to target.
/// You may assume that each input would have exactly one solution, and you may not use the same element twice.
/// You can return the answer in any order.

final class TwoSumTests: XCTestCase {
    
    func test_sut() {
        let sut = makeSUT()
        
        let result1 = sut.twoSum([2, 7, 11, 15], 9)
        XCTAssertEqual(result1, [0, 1])
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> Solution {
        return Solution()
    }
    
    class Solution {
        func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
            var result: [Int] = []
            for index in 0..<nums.count {
                if nums[index] + nums[index + 1] == target {
                    result.append(index)
                    result.append(index + 1)
                    break
                }
            }
            return result
        }
    }
}
