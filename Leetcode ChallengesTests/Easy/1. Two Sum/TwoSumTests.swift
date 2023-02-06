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
        
        let result2 = sut.twoSum([3, 2, 4], 6)
        XCTAssertEqual(result2, [1, 2])
        
        let result3 = sut.twoSum([3, 3], 6)
        XCTAssertEqual(result3, [0, 1])
        
        let result4 = sut.twoSum([3, 1, 3], 6)
        XCTAssertEqual(result4, [0, 2])
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> Solution {
        return Solution()
    }
    
    class Solution {
        func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
            func findSecondPairFor(number: Int, startIndex: Int) -> Int? {
                var found: Int?
                
                for index in startIndex..<nums.count {
                    if number + nums[index] == target {
                        found = index
                        break
                    }
                }
                return found
            }
            
            guard nums.count > 2 else { return [0, 1] }
            
            var result: [Int] = []
            for index in 0..<nums.count {
                let number = nums[index]
                guard let pairIndex = findSecondPairFor(number: number, startIndex: index + 1) else {
                    continue
                }
                result = [index, pairIndex]
                break
            }
            return result
        }
    }
}
