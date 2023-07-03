use criterion::{black_box, Criterion};
use ::problems::*;

///
/// Benchmark for problem 2.
/// 
pub fn run(c: &mut Criterion) {
  c.bench_function(
    "Problem 3", 
    |b| b.iter(
      || problem3::solve(
        black_box(600851475143 as i64)
      )
    )
  );
}
