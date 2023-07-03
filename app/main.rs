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

  // Problem 2
  colorize(2, problems::problem2::solve(4000000));
}

