
use criterion::{black_box, Criterion};
use ::problems::*;

///
/// Benchmark for problem 2.
/// 
pub fn run(c: &mut Criterion) {
  c.bench_function(
    "Problem", 
    |b| b.iter(
      || problem2::solve(
        black_box(4000000)
      )
    )
  );
}
