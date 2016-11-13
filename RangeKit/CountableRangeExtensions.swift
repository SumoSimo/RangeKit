//
//  CountableRangeExtensions.swift
//  RangeKit
//
//  Created by Simon Tsai on 11/12/16.
//  Copyright © 2016 Simon Tsai. All rights reserved.
//

public extension CountableRange {
  
  /// Splits a range against another range. For example:
  ///
  /// Assuming |-------[]| denotes a CountableRange, where the vertical bar, |, denotes either the lower or upper bound, 
  /// if the first range |-------[]| is split against
  /// the second range |----[]|
  ///                         |--[]| then we're left with the right portion of the first range (as shown on the left).
  ///
  public func split(against range: CountableRange) -> [CountableRange] {
    
    return split(whereSeparator: { element -> Bool in
      
      return range.contains(element)
      
    })
    
  }
  
}
