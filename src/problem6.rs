//! Project Euler, Problem 6
//! 
//! The sum of the squares of the first ten natural numbers is,
//! 1^2 + 2^2 + ... + 10^2 = 385.
//! 
//! The square of the sum of the first ten natural numbers is,
//! (1 + 2 + ... + 10)^2 = 55^2 = 3025.
//! 
//! Hence the difference between the sum of the squares of the
//! first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
//! 
//! Find the difference between the sum of the squares of the first one hundred
//! natural numbers and the square of the sum.

use std::{iter::Sum, ops::{RangeInclusive}};

use num::{PrimInt};

/// Given a range, return the difference between
/// (1) the square of their sum, and
/// (2) the sum of their squares.
/// 
/// # Example
/// ```
/// use problems::problem6::solve;
/// 
/// assert_eq!(solve((1..=10)), 2640);
/// ```
pub fn solve<T: PrimInt + Sum>(range: RangeInclusive<T>) -> T where RangeInclusive<T>: Iterator<Item=T> {
  let sum_of_squares = range.clone()
    .map(|x| x * x)
    .sum::<T>();
  let square_of_sum = range
    .sum::<T>()
    .pow(2);
  square_of_sum - sum_of_squares
}

