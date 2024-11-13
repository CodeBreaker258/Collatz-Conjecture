const std = @import("std");

fn collatz_length(n: u64) u64 {
    var count: u64 = 0;
    var current = n;
    while (current != 1) {
        if (current % 2 == 0) {
            current /= 2;
        } else {
            current = 3 * current + 1;
        }
        count += 1;
    }
    return count;
}

fn in_array(new_num: u64, array: [10]u64) bool {
    for (array) |item| {
        if (item == new_num) {
            return true;
        }
    }
    return false;
}

fn bubble_sort(steps: *[10]u64, positions: *[10]u64) void {
    var swapped: bool = true;
    var n: usize = steps.len;

    while (swapped) {
        swapped = false;
        for (0..n - 1) |j| {
            if (steps[j] < steps[j + 1]) {
                // Swap steps
                const temp_step = steps[j];
                steps[j] = steps[j + 1];
                steps[j + 1] = temp_step;

                // Swap positions accordingly
                const temp_pos = positions[j];
                positions[j] = positions[j + 1];
                positions[j + 1] = temp_pos;

                swapped = true;
            }
        }
        n -= 1;
    }
}

pub fn main() void {
    var PosArray: [10]u64 = .{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
    var StepsArray: [10]u64 = .{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

    for (1..5000) |i| {
        const steps = collatz_length(i);
        if (steps > StepsArray[StepsArray.len - 1] and !in_array(steps, StepsArray)) {
            StepsArray[StepsArray.len - 1] = steps;
            PosArray[PosArray.len - 1] = i;
            bubble_sort(&StepsArray, &PosArray);
        }
    }

    const stdout = std.io.getStdOut().writer();
    stdout.print("Here are the Top 10 based on Magnitude of Position:\n", .{}) catch return;
    stdout.print("Position: {any}\n", .{PosArray}) catch return;
    stdout.print("Steps: {any}\n\n", .{StepsArray}) catch return;

    // Sort PosArray based on magnitude
    for (PosArray) |_| {
        for (PosArray) |j| {
            if (j + 1 >= PosArray.len) break;
            if (PosArray[j] < PosArray[j + 1]) {
                // Swap positions
                const temp_pos = PosArray[j];
                PosArray[j] = PosArray[j + 1];
                PosArray[j + 1] = temp_pos;

                // Swap steps accordingly
                const temp_step = StepsArray[j];
                StepsArray[j] = StepsArray[j + 1];
                StepsArray[j + 1] = temp_step;
            }
        }
    }

    stdout.print("Here are the Top 10 based on Magnitude of Position:\n", .{}) catch return;
    stdout.print("Position: {any}\n", .{PosArray}) catch return;
    stdout.print("Steps: {any}\n\n", .{StepsArray}) catch return;
}
