// Copyright © 2023 Almost Engineer. All rights reserved.

import XCTest

//  48. Rotate Image
/// You are given an n x n 2D matrix representing an image, rotate the image by 90 degrees (clockwise).
/// You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.

#warning("Rework this in more effecient way")
final class RotateImageTests: XCTestCase {
    
    func test_sut() {
        let sut = makeSUT()
        
        var matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
        sut.rotate(&matrix)
        
        XCTAssertEqual(matrix, [[7, 4, 1], [8, 5, 2], [9, 6, 3]])
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> Solution {
        return Solution()
    }
    
    class Solution {
        func rotate(_ matrix: inout [[Int]]) {
            let n = matrix[0].count
            
            guard n > 1 else { return }
            
            for row in 0..<n {
                matrix.append([])
                for item in 0..<n {
                    matrix[n + row].append(matrix[(n - 1) - item][row])
                }
            }
            
            matrix.removeSubrange(0..<n)
        }
    }
}
