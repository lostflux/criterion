use criterion::{black_box, Criterion};
use ::problems::*;

///
/// Benchmark for problem 2.
/// 
pub fn run(c: &mut Criterion) {
  c.bench_function(
    "Problem #6", 
    |b| b.iter(
      || problem6::solve(
        black_box(1..=100)
      )
    )
  );
}
