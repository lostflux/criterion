
use num::bigint::BigInt;


/**
 * Function to take a big-int and format with to be 80 digits wide.
 * 
 */
fn pretty_format(val: BigInt) -> String {
  // let s = val.to_string();
  let s = val.to_string();
  let mut result = String::new();
  let mut count = 0;
  for c in s.chars() {
    result.push(c);
    count += 1;
    if count % 80 == 0 {
      result.push('\n');
    }
  }
  result
}

// -- | Print provided number in Green.
fn colorize(id: i32, solution: BigInt) {
  // set print color to blue
  print!("\x1b[0;32m");
  print!("\n--------------------------------------------------------------------------------\n");
  print!("Problem/#{} (rust)\n", id);
  print!("--------------------------------------------------------------------------------\n");
  print!("{}\n", pretty_format(solution));
  print!("--------------------------------------------------------------------------------\n\n");
  // reset print color
  print!("\x1b[0m");
}


fn main() {
  
  // Problem 1
  colorize(1, problems::problem1::solve(vec![3,5], 1000));
}

