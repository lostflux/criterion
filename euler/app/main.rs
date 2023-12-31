///
/// Format any input value to a pretty string
/// that is split into 80 character lines.
/// 
/// # Example
/// ```
/// use problems::pretty_format;
/// 
/// assert_eq!(pretty_format(1234567890), "1234567890");
/// ```
/// 
fn pretty_format<T: std::fmt::Display>(val: T) -> String {
  // let s = val.to_string();
  let s = format!("{}", val);
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

///
/// Print a problem solution in color.
/// 
fn colorize<T: std::fmt::Display>(id: i32, solution: T) {
  // set print color to blue
  print!("\x1b[0;32m");
  print!("\n--------------------------------------------------------------------------------\n");
  print!("Problem/#{id} (rust)\n");
  print!("--------------------------------------------------------------------------------\n");
  print!("{}\n", pretty_format(solution));
  print!("--------------------------------------------------------------------------------\n\n");
  // reset print color
  print!("\x1b[0m");
}


fn main() {
  
  // Problem 1
  colorize(1, problems::problem1::solve(vec![3,5], 1000));

  // Problem 2
  colorize(2, problems::problem2::solve(4000000));

  // Problem 3
  colorize(3, problems::problem3::solve(600_851_475_143 as i64));

  // Problem 4
  colorize(4, problems::problem4::solve(100..1000));

  // Problem 5
  colorize(5, problems::problem5::solve((1..20).collect()));

  // Problem 6
  colorize(6, problems::problem6::solve(1..=100));

  // Problem 7
  colorize(7, problems::problem7::solve(10_001));
}

