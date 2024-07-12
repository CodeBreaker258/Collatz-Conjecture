const std = @import("std");

fn collatz(n: u64) u64 {
    const csteps: u64 = 0;
    if(n != 1){
        if(n % 2 == 1){
            n = (3*n)+1;
            csteps = collatz(n) + 1;
        }else{
			n = n / 2;
			csteps = 1 + collatz(n);
		}
    }
}
fn inArray (newNum: u64, CStepsArray: []u64) bool {
        for (CStepsArray) |item| {
        if (item == newNum) {
            return true;
        }
    }
    return false;
}

fn heapSort(a:[10]u64, b:[10]u64){
        
}

pub fn main() !void {
    const args = std.os.argv;
    const maxValue: u64 = 5_000_000_000;
    const startValue = std.fmt.parseInt(u64, args[1], 10);
    const endValue = std.fmt.parseInt(u64, args[1], 10);
    var PosArray: [10]u64 = [_]u64{0} ** 10;
    var StepsArray: [10]u64 = [_]u64{0} ** 10;

    for (maxValue) |i| {
        const comp = collatz(i);
        if(comp > StepsArray and (!(inArray(comp, StepsArray)))){
            PosArray[0] = i;
            StepsArray[0]=comp;
        }
    }


    if (startValue <= maxValue and endValue <= maxValue) {
        const result = collatz(startValue, 0); // Start with 0 as the initial counter value
        std.debug.print("Steps for {}: {}\n", .{ startValue, result });
    } else {
        std.debug.print("Error: '{}' exceeds max value size.\n", .{args[1]});
    }
}
