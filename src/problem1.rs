
use num::bigint::BigInt;

///
/// Project Euler - Problem 1:
/// Find the sum all all multiples of 3 or 5 below 1000.
/// 
/// # Example
/// ```
/// use num::BigInt;
/// use problems::problem1::solve;
/// 
/// assert_eq!(solve(vec![3,5], 10), BigInt::from(23));
/// assert_eq!(solve(vec![3,5], 1000), BigInt::from(233168));
/// ```
pub fn solve(divisors: Vec<i32>, limit: i32) -> BigInt {

  // largest bigint possible
  let mut sum: BigInt = BigInt::from(0);

  for i in 1..limit {
    for divisor in &divisors {
      if i % divisor == 0 {
        sum += i;
        break;
      }
    }
  }
  sum
}

#[cfg(test)]
mod tests {
  use super::*;

  #[test]
  fn test_solve() {
    assert_eq!(solve(vec![3,5], 10), BigInt::from(23));
    assert_eq!(solve(vec![3,5], 1000), BigInt::from(233168));
  }
}

