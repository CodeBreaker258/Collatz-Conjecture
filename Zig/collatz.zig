const std = @import("std");

fn collatz(n: u64) u64 {
    std.log.info("collatz called with n: {d}", .{n});
    var steps: u64 = 0;
    var current = n;
    while (current != 1) {
        if (current % 2 == 0) {
            current /= 2;
        } else {
            current = 3 * current + 1;
        }
        steps += 1;
        std.log.info("Intermediate value: {d}, count: {d}", .{ current, steps });
    }
    return steps;
}

fn isInArray(newNum: u64, collatzSteps: [10]u64) bool {
    for (collatzSteps) |step| {
        if (step == newNum) {
            return true;
        }
    }
    return false;
}

fn sortArrays(posArray: *[10]u64, stepsArray: *[10]u64) void {
    var swapped: bool = true;
    while (swapped) {
        swapped = false;
        for (0..9) |i| {
            if (stepsArray[i] < stepsArray[i + 1]) {
                const tempStep = stepsArray[i];
                stepsArray[i] = stepsArray[i + 1];
                stepsArray[i + 1] = tempStep;

                const tempPos = posArray[i];
                posArray[i] = posArray[i + 1];
                posArray[i + 1] = tempPos;

                swapped = true;
            }
        }
    }
}

pub fn main() void {
    const maxValue: u64 = 5_000_000_000;
    var posArray = [10]u64{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
    var stepsArray = [10]u64{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

    for (0..maxValue) |n| {
        const comp = collatz(n);
        if (comp > stepsArray[9] and (!isInArray(comp, stepsArray))) {
            posArray[9] = n;
            stepsArray[9] = comp;
            sortArrays(&posArray, &stepsArray);
        }
    }

    std.log.info("posArray: {any}\n", .{posArray});
    std.log.info("stepsArray: {any}\n", .{stepsArray});
}
