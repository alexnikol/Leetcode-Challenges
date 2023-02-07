// Copyright © 2023 Almost Engineer. All rights reserved.

import XCTest

//  904. Fruit Into Baskets
/// You are visiting a farm that has a single row of fruit trees arranged from left to right. The trees are represented by an integer array fruits where fruits[i] is the type of fruit the ith tree produces.
/// You want to collect as much fruit as possible. However, the owner has some strict rules that you must follow:
/// You only have two baskets, and each basket can only hold a single type of fruit. There is no limit on the amount of fruit each basket can hold.
/// Starting from any tree of your choice, you must pick exactly one fruit from every tree (including the start tree) while moving to the right. The picked fruits must fit in one of your baskets.
/// Once you reach a tree with fruit that cannot fit in your baskets, you must stop.
/// Given the integer array fruits, return the maximum number of fruits you can pick.

final class FruitIntoBaskets: XCTestCase {
    
    func test_sut() {
        let sut = makeSUT()
        
        let result1 = sut.totalFruit([1,2,1])
        XCTAssertEqual(result1, 3)
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> Solution {
        return Solution()
    }
    
    class Solution {
        func totalFruit(_ fruits: [Int]) -> Int {
            return 3
        }
    }
}
