use criterion::{black_box, Criterion};
use ::problems::*;

///
/// Benchmark for problem 2.
/// 
pub fn run(c: &mut Criterion) {
  c.bench_function(
    "Problem #7", 
    |b| b.iter(
      || problem7::solve(
        black_box(10_001)
      )
    )
  );
}
