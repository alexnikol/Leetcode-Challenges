// Copyright © 2023 Almost Engineer. All rights reserved.

import XCTest

//  1470. Shuffle the Array
/// Given the array nums consisting of 2n elements in the form [x1,x2,...,xn,y1,y2,...,yn].
/// Return the array in the form [x1,y1,x2,y2,...,xn,yn].

final class ShuffleTheArrayTests: XCTestCase {
    
    func test_sut() {
        let sut = makeSUT()
        
        let result1 = sut.shuffle([2,5,1,3,4,7], 3)
        XCTAssertEqual(result1, [2,3,5,4,1,7])
        
        let result2 = sut.shuffle([1,2,3,4,4,3,2,1], 4)
        XCTAssertEqual(result2, [1,4,2,3,3,2,4,1])
        
        let result3 = sut.shuffle([1,1,2,2], 2)
        XCTAssertEqual(result3, [1,2,1,2])
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> Solution {
        return Solution()
    }
    
    class Solution {
        func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
            var result: [Int] = []
            for index in 0..<n {
                result.append(nums[index])
                result.append(nums[index + n])
            }
            return result
        }
    }
}
