//! Problem 1: Multiples of 3 and 
//! 
//! If we list all the natural numbers below 10 that are multiples of 3 or 5,
//! we get 3, 5, 6 and 9. The sum of these multiples is 23.
//! 
//! Find the sum of all multiples of 3 or 5 below 1000.

use num::{traits::PrimInt};
use std::ops::Range;

///
/// Project Euler - Problem 1:
/// Find the sum all all multiples of 3 or 5 below 1000.
/// 
/// # Example
/// ```
/// use num::BigInt;
/// use problems::problem1::solve;
/// 
/// assert_eq!(solve(vec![3,5], 10), 23);
/// assert_eq!(solve(vec![3,5], 1000), 233168);
/// ```
pub fn solve<T: PrimInt>(divisors: Vec<T>, limit: T) -> T where Range<T>: Iterator<Item = T> {
  let mut sum = T::zero();

  for i in T::one()..limit {
    for divisor in &divisors {
      if i % *divisor == T::zero() {
        sum = sum + i;
        break;
      }
    }
  }
  return sum;
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

