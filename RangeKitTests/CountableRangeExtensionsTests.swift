//
//  CountableRangeExtensionsTests.swift
//  RangeKit
//
//  Created by Simon Tsai on 11/12/16.
//  Copyright © 2016 Simon Tsai. All rights reserved.
//

@testable import RangeKit

import XCTest

// For the following test cases, use the following as a guide:
//
// |-------[]| denotes a CountableRange
//
// where the vertical bar, |, denotes either the lower or upper bound.
//
// In the following, the top range denotes the range that will be split,
// while the bottom range denotes the range that the first range will be split against.
//
//       |-------[]|
// |-------[]|
//
// This results in the following:
//
//           |---[]|
//
// which is the remnant of the first range that was split.
//
// Note that the picture representation is just a general idea of a range and does not represent the exact range.
//
// Hopefully, that helps you visualize what these tests are about.
//

class CountableRangeSplittingTests: XCTestCase {
  
  // |-------[]|
  // |-------[]|
  func testCountableRangeSplitByEqualCountableRangeYieldsCorrectRanges() {
    
    let rangeToBeSplit = CountableRange(uncheckedBounds: (lower: 0, upper: 10))
    
    let rangeToSplitAgainst = CountableRange(uncheckedBounds: (lower: 0, upper: 10))
    
    XCTAssertEqual(rangeToBeSplit.split(against: rangeToSplitAgainst), [])
    
  }
  
  // |-------[]|
  // |-----[]|
  func testCountableRangeSplitBySmallerCountableRangeThatHasSameLowerBoundYieldsCorrectRanges() {
    
    let rangeToBeSplit = CountableRange(uncheckedBounds: (lower: 0, upper: 10))
    
    let rangeToSplitAgainst = CountableRange(uncheckedBounds: (lower: 0, upper: 7))
    
    let correctRanges = [CountableRange(uncheckedBounds: (lower: 7, upper: 10))]
    
    XCTAssertEqual(rangeToBeSplit.split(against: rangeToSplitAgainst), correctRanges)
    
  }
  
  // |-------[]|
  //    |----[]|
  func testCountableRangeSplitBySmallerRangeThatHasSameUpperBoundYieldsCorrectRanges() {
    
    let rangeToBeSplit = CountableRange(uncheckedBounds: (lower: 0, upper: 10))
    
    let rangeToSplitAgainst = CountableRange(uncheckedBounds: (lower: 6, upper: 10))
    
    let correctRanges = [CountableRange(uncheckedBounds: (lower: 0, upper: 6))]
    
    XCTAssertEqual(rangeToBeSplit.split(against: rangeToSplitAgainst), correctRanges)
    
  }
  
  // |-------[]|
  //   |---[]|
  func testCountableRangeSplitBySmallerRangeWithoutMatchingLowerOrUpperBoundsYieldsCorrectRanges() {
    
    let rangeToBeSplit = CountableRange(uncheckedBounds: (lower: 0, upper: 10))
    
    let rangeToSplitAgainst = CountableRange(uncheckedBounds: (lower: 6, upper: 9))
    
    let correctRanges = [
      CountableRange(uncheckedBounds: (lower: 0, upper: 6)),
      CountableRange(uncheckedBounds: (lower: 9, upper: 10))
    ]
    
    XCTAssertEqual(rangeToBeSplit.split(against: rangeToSplitAgainst), correctRanges)
    
  }
  
  //      |-------[]|
  // |-------[]|
  func testCountableRangeSplitByCountableRangeWhoseLowerAndUpperBoundsWrapTargetsLowerBoundYieldsCorrectRanges() {
    
    let rangeToBeSplit = CountableRange(uncheckedBounds: (lower: 5, upper: 10))
    
    let rangeToSplitAgainst = CountableRange(uncheckedBounds: (lower: 0, upper: 7))
    
    let correctRanges = [CountableRange(uncheckedBounds: (lower: 7, upper: 10))]
    
    XCTAssertEqual(rangeToBeSplit.split(against: rangeToSplitAgainst), correctRanges)
    
  }
  
  //           |-------[]|
  // |-------[]|
  func testCountableRangeSplitByCountableRangeWhoseUpperBoundMatchesOtherLowerBoundYieldsCorrectRanges() {
    
    let rangeToBeSplit = CountableRange(uncheckedBounds: (lower: 5, upper: 10))
    
    let rangeToSplitAgainst = CountableRange(uncheckedBounds: (lower: 0, upper: 5))
    
    let correctRanges = [CountableRange(uncheckedBounds: (lower: 5, upper: 10))]
    
    XCTAssertEqual(rangeToBeSplit.split(against: rangeToSplitAgainst), correctRanges)
    
  }
  
  // |-------[]|
  //      |-------[]|
  func testCountableRangeSplitByCountableRangeWhoseLowerAndUpperBoundsWrapTargetsUpperBoundYieldsCorrectRanges() {
    
    let rangeToBeSplit = CountableRange(uncheckedBounds: (lower: 5, upper: 10))
    
    let rangeToSplitAgainst = CountableRange(uncheckedBounds: (lower: 7, upper: 15))
    
    let correctRanges = [CountableRange(uncheckedBounds: (lower: 5, upper: 7))]
    
    XCTAssertEqual(rangeToBeSplit.split(against: rangeToSplitAgainst), correctRanges)
    
  }
  
  // |-------[]|
  //           |-------[]|
  func testCountableRangeSplitByCountableRangeWhoseLowerBoundMatchesOtherUpperBoundYieldsCorrectRanges() {
    
    let rangeToBeSplit = CountableRange(uncheckedBounds: (lower: 5, upper: 10))
    
    let rangeToSplitAgainst = CountableRange(uncheckedBounds: (lower: 10, upper: 15))
    
    let correctRanges = [CountableRange(uncheckedBounds: (lower: 5, upper: 10))]
    
    XCTAssertEqual(rangeToBeSplit.split(against: rangeToSplitAgainst), correctRanges)
    
  }
  
  //               |-------[]|
  // |-------[]|
  func testCountableRangeSplitByCountableRangeCompletelyOffTheGridToTheLeftYieldsCorrectRanges() {
    
    let rangeToBeSplit = CountableRange(uncheckedBounds: (lower: 10, upper: 15))
    
    let rangeToSplitAgainst = CountableRange(uncheckedBounds: (lower: 0, upper: 5))
    
    let correctRanges = [CountableRange(uncheckedBounds: (lower: 10, upper: 15))]
    
    XCTAssertEqual(rangeToBeSplit.split(against: rangeToSplitAgainst), correctRanges)
    
  }
  
  // |-------[]|
  //               |-------[]|
  func testCountableRangeSplitByCountableRangeCompletelyOffTheGridToTheRightYieldsCorrectRanges() {
    
    let rangeToBeSplit = CountableRange(uncheckedBounds: (lower: 10, upper: 15))
    
    let rangeToSplitAgainst = CountableRange(uncheckedBounds: (lower: 20, upper: 25))
    
    let correctRanges = [CountableRange(uncheckedBounds: (lower: 10, upper: 15))]
    
    XCTAssertEqual(rangeToBeSplit.split(against: rangeToSplitAgainst), correctRanges)
    
  }
  
  //         |-------[]|
  // |-----------------------[]|
  func testCountableRangeSplitBySwallowingCountableRangeYieldsCorrectRanges() {
    
    let rangeToBeSplit = CountableRange(uncheckedBounds: (lower: 10, upper: 15))
    
    let rangeToSplitAgainst = CountableRange(uncheckedBounds: (lower: 0, upper: 25))
    
    XCTAssertEqual(rangeToBeSplit.split(against: rangeToSplitAgainst), [])
    
  }
  
}
