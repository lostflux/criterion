//! Project Euler, Problem 7
//!
//! Listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that
//! the 6th prime is 13.
//! 
//! What is the 10 001st prime number?

use num::integer::Roots;

/// Returns the nth prime number.
/// 
/// # Examples
/// ```
/// use problems::problem7::solve;
/// 
/// assert_eq!(solve(6), 13);
/// assert_eq!(solve(10001), 104743);
/// ```
pub fn solve(n: i32) -> i32 {
  let mut primes = Vec::<i32>::new();
  let mut i = 1;
  while (primes.len() as i32) < n {
    i += 1;
    if is_prime(i, &primes) {
      primes.push(i);
    }
  }
  i
}

fn is_prime(n: i32, primes: &Vec<i32>) -> bool {
  let sqrt = n.sqrt();
  for i in primes {
    if *i > sqrt { break; }
    let rem = n % *i;
    if rem == 0 { return false; }
  }
  true
}
