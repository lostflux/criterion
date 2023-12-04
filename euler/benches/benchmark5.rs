use criterion::{black_box, Criterion};
use ::problems::*;

///
/// Benchmark for problem 2.
/// 
pub fn run(c: &mut Criterion) {
  c.bench_function(
    "Problem #5", 
    |b| b.iter(
      || problem5::solve(
        black_box((1..=20).collect())
      )
    )
  );
}
