// #[macro_use]
extern crate criterion;
use criterion::{criterion_group, criterion_main};

mod benchmark1;
mod benchmark2;
mod benchmark3;
mod benchmark4;

criterion_main!(benches);

criterion_group!(benches,
    benchmark1::run
  , benchmark2::run
  , benchmark3::run
  , benchmark4::run
);
