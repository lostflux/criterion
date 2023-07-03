//! Problem 1: Multiples of 3 and 
//! 
//! If we list all the natural numbers below 10 that are multiples of 3 or 5,
//! we get 3, 5, 6 and 9. The sum of these multiples is 23.
//! 
//! Find the sum of all multiples of 3 or 5 below 1000.


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
pub fn solve(divisors: Vec<i32>, limit: i32) -> i32 {

  // largest bigint possible
  let mut sum = 0;

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
    assert_eq!(solve(vec![3,5], 10), 23);
    assert_eq!(solve(vec![3,5], 1000), 233168);
  }
}

