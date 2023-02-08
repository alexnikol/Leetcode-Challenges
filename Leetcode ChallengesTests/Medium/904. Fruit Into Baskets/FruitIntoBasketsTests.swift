// Copyright © 2023 Almost Engineer. All rights reserved.

import XCTest

//  904. Fruit Into Baskets
/// You are visiting a farm that has a single row of fruit trees arranged from left to right. The trees are represented by an integer array fruits where fruits[i] is the type of fruit the ith tree produces.
/// You want to collect as much fruit as possible. However, the owner has some strict rules that you must follow:
/// You only have two baskets, and each basket can only hold a single type of fruit. There is no limit on the amount of fruit each basket can hold.
/// Starting from any tree of your choice, you must pick exactly one fruit from every tree (including the start tree) while moving to the right. The picked fruits must fit in one of your baskets.
/// Once you reach a tree with fruit that cannot fit in your baskets, you must stop.
/// Given the integer array fruits, return the maximum number of fruits you can pick.

#warning("Rework this in more effecient way")
final class FruitIntoBasketsTests: XCTestCase {
    
    func test_sut() {
        let sut = makeSUT()
        
        let result1 = sut.totalFruit([1,2,1])
        XCTAssertEqual(result1, 3)

        let result2 = sut.totalFruit([0,1,2,2])
        XCTAssertEqual(result2, 3)

        let result3 = sut.totalFruit([1,2,3,2,2])
        XCTAssertEqual(result3, 4)
        
        let result4 = sut.totalFruit([3,3,3,1,2,1,1,2,3,3,4])
        XCTAssertEqual(result4, 5)
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> Solution {
        return Solution()
    }
    
    class Solution {
        func totalFruit(_ fruits: [Int]) -> Int {
            func possibleTreesCountFromIndex(_ index: Int) -> Int {
                var treeType1: Int?
                var treeType2: Int?
                var treesCount = 0
                
                for i in index..<fruits.count {
                    if let treeType1 = treeType1, let treeType2 = treeType2 {
                        if fruits[i] != treeType1 && fruits[i] != treeType2 {
                            break
                        }
                    }
                    if treeType1 == nil {
                        treeType1 = fruits[i]
                    }
                    if treeType2 == nil && fruits[i] != fruits[index] {
                        treeType2 = fruits[i]
                    }
                    if treeType1 != nil {
                        treesCount += 1
                    } else if treeType2 != nil {
                        treesCount += 1
                    }
                }
                return treesCount
            }
            
            var maxTrees = 0
            for i in 0..<fruits.count {
                if i > 0 && fruits[i] == fruits[i - 1] {
                    continue
                }
                if maxTrees > fruits.count - i {
                    break
                }
                let possibleMax = possibleTreesCountFromIndex(i)
            
                if possibleMax > maxTrees {
                    maxTrees = possibleMax
                }
            }
            return maxTrees
        }
    }
}
