//! Problem 5
//! =========
//! 2520 is the smallest number that can be divided by each of the numbers
//! from 1 to 10 without any remainder.
//! 
//! What is the smallest positive number that is evenly divisible by all of the
//! numbers from 1 to 20?

use std::{collections::BTreeSet as Set, ops::Range, cmp::{min, max}};

use num::traits::PrimInt;

/// Returns the smallest positive number that is evenly divisible by all of the
/// numbers in the given set.
/// 
/// # Examples
/// ```
/// use problems::problem5::solve;
/// use std::collections::BTreeSet;
/// 
/// assert_eq!(solve(BTreeSet::<i32>::from([]).into_iter().collect()), 1);
/// 
/// let set: BTreeSet<i32> = [2,3,4].into_iter().collect(); 
/// assert_eq!(solve(set.clone()), 12);
/// assert_eq!(solve(set), 12);
/// ```
pub fn solve<T: PrimInt>(set: Set<T>) -> T where Range<T>: Iterator<Item = T> {
  let mut result = T::one();
  for divisor in set {
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
