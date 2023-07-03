//! Each value in the Fibonacci sequence is generated by adding the previous two terms.
//! 
//! By starting with 1 and 2, the first 10 terms will be:
//! 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
//! 
//! By considering the terms in the Fibonacci sequence whose values do not exceed four million,
//! find their sum.
//! 

/// Project Euler - Problem 2:
/// Find the sum of all even Fibonacci numbers below a given limit.
/// 
/// # Example
/// ```
/// use problems::problem2::solve;
/// 
/// assert_eq!(solve(10), 10);
/// assert_eq!(solve(100), 44);
/// assert_eq!(solve(4000000), 4613732);
/// ```
pub fn solve(limit: i32) -> i32 {

  let mut sum = 0;
  let mut curr = 1;
  let mut next = 2;

  while curr < limit {
    if curr % 2 == 0 {
      sum += curr;
    }
    let temp = curr;
    curr = next;
    next = temp + next;
  }
  sum
}
