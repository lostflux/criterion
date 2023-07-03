use criterion::{black_box, Criterion};
use ::problems::*;

///
/// Benchmark for problem 2.
/// 
pub fn run(c: &mut Criterion) {
  c.bench_function(
    "Problem 4", 
    |b| b.iter(
      || problem4::solve(
        black_box(100..1000)
      )
    )
  );
}
