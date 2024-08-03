const std = @import("std");
const print = std.debug.print;

fn collatz(n: u64) u64 {
    var collatzSteps: u64 = 0;
    var current = n;
    while (current != 1) {
        if (current % 2 == 1) {
            current = 3 * current + 1;
        } else {
            current /= 2;
        }
        collatzSteps += 1;
    }
    return collatzSteps;
}
fn isInArray(newNum: u64, collatzSteps: [10]u64) bool {
    var arraySize: u64 = 0;
    arraySize = collatzSteps.len;

    for (0..arraySize) |j| {
        if (j == newNum) {
            return true;
        }
    }
    return false;
}

pub fn main() void {
    const maxValue: u64 = 5_000_000_000;
    var posArray = [10]u64{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
    var stepsArray = [10]u64{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

    for (0..maxValue) |n| {
        const comp = collatz(n);
        if (comp > stepsArray[0] and (!isInArray(comp, stepsArray))) {
            posArray[0] = n;
            stepsArray[0] = comp;
        }
    }
    //Sorting Function
    print("posArray, {any}\n", .{posArray});
    print("stepsArray, {any}\n", .{stepsArray});
}
