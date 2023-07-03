extern crate criterion;
use criterion::{black_box, Criterion};
use ::problems::*;

pub fn run(c: &mut Criterion) {
  c.bench_function(
    "Problem #1", 
    |b| b.iter(
      || problem1::solve(
        black_box(vec![3,5]),
        black_box(1000)
      )
    )
  );
}
