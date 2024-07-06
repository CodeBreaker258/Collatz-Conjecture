const std = @import("std");

fn collatz(n: u64, counter: u64) u64 {
    var localCounter = counter + 1;
    std.debug.print("{}: {}\n", .{ counter, n });
    if (n == 1) {
        return localCounter;
    } else if (n % 2 == 0 and n <= 5_000_000_000) {
        return collatz(n / 2, localCounter);
    } else {
        return collatz(3 * n + 1, localCounter);
    }
    //todo: store all n in array of type u64, use a sorting algorithm to get 10 lowest
}

pub fn main() void {
    const startValue: u64 = 5_000_000_000;
    const result = collatz(startValue, 0); // Start with 0 as the initial counter value
    std.debug.print("Steps for {}: {}\n", .{ startValue, result });
}
