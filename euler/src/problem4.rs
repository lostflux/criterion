//! Largest palindrome product
//! 
//! A palindromic number reads the same both ways.
//! 
//! The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 x 99.
//! 
//! Find the largest palindrome made from the product of two 3-digit numbers.

use std::ops::Range;
use num::PrimInt;
use std::fmt::Display;


/// Project Euler - Problem 4:
/// Find the largest palindrome made from the product of two in a given range (upper exclusive).
/// 
/// # Example
/// ```
/// use problems::problem4::solve;
/// 
/// assert_eq!(solve(10..100), 9009);
/// assert_eq!(solve(100..1000), 906609);
/// ```
pub fn solve<T: PrimInt + Display>(range: Range<T>) -> T where Range<T>: Iterator<Item = T> {
  let mut largest = T::zero();
  for i in range.clone() {
    for j in i..range.end {
      let product = i * j;
      if is_palindrome(product) && product > largest {
        largest = product;
      }
    }
  }
  largest
}

/// Returns true if the given number is a palindrome,
/// i.e. it reads the same both ways.
fn is_palindrome<T: PrimInt>(number: T) -> bool where T: Display {
  let number_string = number.to_string();
  let reversed_string: String = number_string.chars().rev().collect();
  number_string == reversed_string
}
