
const std = @import("std");
const common = @import("common");
const quantum = @import("quantum");
const crystal = @import("crystal");
const spINIT = @import("spINIT");
const spun = @import("spun");

pub const Color = common.Color;
pub const STARWEAVE = common.STARWEAVE;

fn log(comptime format: []const u8, args: anytype) void {
    std.debug.print(Color.azure ++ format ++ Color.reset ++ "\n", args);
}

pub fn main() !void {
    log("✨ BLOOM Bootloader - STARWEAVE Universe Edition v{s}", .{STARWEAVE.universe_version});
    log("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━", .{});
    log("⟡ Reality Anchor: {s}", .{STARWEAVE.reality_anchor});
    log("⟡ Temporal Coordinate: {s}", .{STARWEAVE.temporal_coordinate});

    var state = try spINIT.spINIT();
    try state.displayStatus();
    try spun.spun(&state);
}

