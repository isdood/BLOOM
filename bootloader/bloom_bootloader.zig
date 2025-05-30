
const std = @import("std");
const starweave = @import("starweave_constants");
const quantum = @import("quantum");
const crystal = @import("crystal");
const spINIT = @import("spINIT");
const spun = @import("spun");

pub const Color = starweave.Color;
pub const STARWEAVE = starweave.STARWEAVE;

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

