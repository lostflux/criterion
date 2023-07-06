// #[macro_use]
extern crate criterion;
use criterion::{criterion_group, criterion_main};

mod benchmark1;
mod benchmark2;
mod benchmark3;
mod benchmark4;
mod benchmark5;
mod benchmark6;

criterion_main!(benches);

criterion_group!(benches,
    benchmark1::run
  , benchmark2::run
  , benchmark3::run
  , benchmark4::run
  , benchmark5::run
  , benchmark6::run
);
