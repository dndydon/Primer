import Combine

public struct Primer {
  var text = "Hello, World!!"
  
  func primes() -> [Int] {
    text.count.primeFactors
  }
  
}


