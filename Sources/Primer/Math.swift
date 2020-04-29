//
//  Math.swift
//  primeNumberDisplay
//
//  Created by Don Sleeter on 1/3/19.
//  Copyright © 2019 Don Sleeter. All rights reserved.
//

import Foundation
import SwiftUI


public extension Double {
  // degrees = radians × 180 / π
  var asDegrees: Double { return self * 180 / .pi }
  
  // radians = degrees × π / 180
  var asRadians: Double { return self * .pi / 180 }
}

public extension CGFloat {
  // degrees = radians × 180 / π
  var asDegrees: CGFloat { return self * 180 / .pi }
  
  // radians = degrees × π / 180
  var asRadians: CGFloat { return self * .pi / 180 }
}



//: Prime & All Factorization

/// Given a positive integer, find its prime factors.
///
/// - parameter number: The number to be factored.
///
/// - returns: Array of factors.
///
/// - TODO: Use a less-naive algorithm. Construct the result lazily.
public func primeFactorsOf(_ number: Int) -> [Int] {
  if number < 4 {
    return [number]
  }
  let lim = Int(sqrt(Double(number)))
  for x in 2...lim {
    if number % x == 0 {
      var result = [x]
      result.append(contentsOf: (primeFactorsOf(number / x)))
      return result
    }
  }
  return [number]
}

/// Array of prime integer factors - property on Int
///
/// - property: primeFactors.
///
/// - returns: Array of integers that are the prime factors of self.
///
public extension Int {
  var primeFactors: [Int] {
    return primeFactorsOf(self)
  }
}

public extension Double {
  var primeFactors: [Int] {
    return primeFactorsOf(Int(floor(self)))
  }
}

/// Boolean property on Int
///
/// - property: isPrime.
///
/// - returns: Bool whether self is prime.
///
public extension Int {
  var isPrime: Bool {
    guard self >= 2     else { return false }
    guard self != 2     else { return true  }
    guard self % 2 != 0 else { return false }
    return !stride(from: 3, through: Int(sqrt(Double(self))), by: 2).contains { self % $0 == 0 }
  }
}

/// Given an integer, return true it is prime, or not.
///
/// - property: isPrime.
///
/// - returns: Bool whether self is prime.
///
public func isPrime(_ n: Int) -> Bool {
  return n.isPrime
}



/// See: https://stackoverflow.com/questions/45445699/most-efficient-way-to-find-all-the-factors-of-a-number
public func allFactors(of n: Int) -> [Int] {
  precondition(n > 0, "n must be positive")
  let sqrtn = Int(Double(n).squareRoot())
  var factors: [Int] = []
  factors.reserveCapacity(2 * sqrtn)
  for i in 1...sqrtn {
    if n % i == 0 {
      factors.append(i)
    }
  }
  var j = factors.count - 1
  if factors[j] * factors[j] == n {
    j -= 1
  }
  while j >= 0 {
    factors.append(n / factors[j])
    j -= 1
  }
  return factors
}



