const std = @import("std");

fn collatz_length(n: u64) u64 {
    var count: u64 = 1;
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

pub fn main() void {
    const args = try std.process.argsAlloc(std.heap.page_allocator);
    defer std.process.argsFree(std.heap.page_allocator, args);

    if (args.len != 3) {
        std.debug.print("Usage: ./collatz (int1) (int2)\n", .{});
        return;
    }

    const int1 = try std.fmt.parseInt(u64, args[1], 10);
    const int2 = try std.fmt.parseInt(u64, args[2], 10);

    var start = if (int1 < int2) int1 else int2;
    var end = if (int1 < int2) int2 else int1;

    var collatz_list = std.ArrayList(struct {
        value: u64,
        length: u64,
    }).init(std.heap.page_allocator);

    defer collatz_list.deinit();
    
    for (start..end) |i| {
        const length = collatz_length(i);
        try collatz_list.append(.{ .value = i, .length = length });
    }

    collatz_list.items.sort((a, b) i32 {
        if (a.length != b.length) {
            return @intCast(i32, b.length) - @intCast(i32, a.length);
        } else {
            return @intCast(i32, a.value) - @intCast(i32, b.value);
        }
    });

    const top_n = if (collatz_list.items.len < 10) collatz_list.items.len else 10;
    const startValue =0;
    for (0..top_n) |i| {
        const item = collatz_list.items[i];
        std.debug.print("{d}: {d}\n", .{ item.value, item.length });
    }
}
