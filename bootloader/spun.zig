
const std = @import("std");
const common = @import("common");
const spINIT = @import("spINIT");
const quantum = @import("quantum");
const crystal = @import("crystal");

pub const Color = common.Color;
pub const STARWEAVE = common.STARWEAVE;

fn log(comptime format: []const u8, args: anytype) void {
    std.debug.print(Color.azure ++ format ++ Color.reset ++ "\n", args);
}

pub fn spun(state: *spINIT.InitializationState) !void {
    log("🌟 STARWEAVE State Initialized", .{});
    quantum.quantum_state.status();
    crystal.crystal_state.status();
    state.state = .complete;
    try state.displayStatus();
}

