
use num::bigint::BigInt;

/**
 * Problem 1: Find sum of multiples of values in a set below a limit.
 */
pub fn solve(divisors: Vec<i32>, limit: i32) -> BigInt {
  let mut sum: BigInt = BigInt::from(0);

  // largest bigint possible
  let mut sum: BigInt = BigInt::from(0);

  for i in 1..1000 {
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

