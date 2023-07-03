//! Problem 5
//! =========
//! 2520 is the smallest number that can be divided by each of the numbers
//! from 1 to 10 without any remainder.
//! 
//! What is the smallest positive number that is evenly divisible by all of the
//! numbers from 1 to 20?

use std::{ops::Range, cmp::{min, max}};

use num::traits::PrimInt;

/// Returns the smallest positive number that is evenly divisible by all of the
/// numbers in the given set.
/// 
/// # Examples
/// ```
/// use problems::problem5::solve;
/// use std::collections::BTreeSet;
/// 
/// assert_eq!(solve(Vec::<i32>::from([])), 1);
/// 
/// assert_eq!(solve(vec![2,3,4]), 12);
/// assert_eq!(solve(vec![2,3,4,5,6,7,8,9,10]), 2520);
/// ```
pub fn solve<T: PrimInt>(divisors: Vec<T>) -> T where Range<T>: Iterator<Item = T> {
  let mut result = T::one();
  for divisor in divisors {
    result = lcm(result, divisor);
  }
  result
}

/// Euclid's algorithm for finding the greatest common divisor of two numbers.
/// 
/// # Examples
/// ```
/// use problems::problem5::gcd;
/// 
/// assert_eq!(gcd(1, 1), 1);
/// assert_eq!(gcd(174, 150), 6);
/// ```
pub fn gcd<T: PrimInt>(a: T, b: T) -> T {

  fn gcd_inner<T: PrimInt>(a: T, b: T) -> T {
    if b == T::zero() {
      a
    } else {
      gcd_inner(b, a % b)
    }
  }
  
  gcd_inner(min(a, b), max(a, b))
}

/// Find the least common multiple of two numbers.
/// 
/// # Examples
/// ```
/// use problems::problem5::lcm;
/// 
/// assert_eq!(lcm(1, 1), 1);
/// assert_eq!(lcm(2, 3), 6);
/// ```
pub fn lcm<T: PrimInt>(a: T, b: T) -> T {
  a * b / gcd(a, b)
}
