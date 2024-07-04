const std = @import("std");

fn collatz(n: u64) u64 {
    if (n == 1) {
        return 1;
    } else if (n % 2 == 0) {
        return collatz(n / 2);
    } else {
        return collatz(3 * n + 1);
    }
}

pub fn main() void {
    const result = collatz(25);
    std.debug.print("Result: {}\n", .{result});
}
