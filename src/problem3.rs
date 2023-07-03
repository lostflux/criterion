//! The prime factors of 13195 are 5, 7, 13 and 29.
//! 
//! What is the largest prime factor of the number 600851475143 ?

use num::traits::PrimInt;

/// Returns the largest prime factor of the given number.
/// 
/// # Examples
/// ```
/// use problems::problem3::solve;
/// 
/// assert_eq!(solve(13195), 29);
/// assert_eq!(solve(600851475143 as i64), 6857);
/// ```
/// 
/// Generic type `T` is used to allow for large numbers.
pub fn solve<T: PrimInt>(mut n: T) -> T {
  let mut i: T = T::one() + T::one();
  // let mut square: T = i.pow(2);
  while i * i < n {
    while n % i == T::zero() {
      n = n / i;
    }
    i = i + T::one();
  }
  return n;
}
