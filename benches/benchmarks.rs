// #[macro_use]
extern crate criterion;
use criterion::{black_box, criterion_group, criterion_main, Criterion};
use ::problems::*;

fn benchmark1(c: &mut Criterion) {
  c.bench_function(
    "Problem 1", 
    |b| b.iter(
      || problem1::solve(
        black_box(vec![3,5]),
        black_box(1000)
      )
    )
  );
}

fn benchmark2(c: &mut Criterion) {
  c.bench_function(
    "Problem 2", 
    |b| b.iter(
      || problem1::solve(
        black_box(vec![3,5]),
        black_box(1000000)
      )
    )
  );
}

criterion_group!(benches,
  benchmark1,
  benchmark2
);
criterion_main!(benches);
