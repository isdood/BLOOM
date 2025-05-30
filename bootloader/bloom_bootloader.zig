
const std = @import("std");
const quantum = @import("quantum");
const crystal = @import("crystal");
const starweave = @import("starweave");
const spINIT = @import("./spINIT.zig");
const spun = @import("./spun.zig");

pub const STARWEAVE = struct {
    pub const universe_version = "0.1.0";
    pub const quantum_alignment = true;
    pub const crystal_resonance = true;
};

pub const Color = struct {
    pub const sage = "\x1b[38;5;71m";
    pub const azure = "\x1b[38;5;39m";
    pub const lavender = "\x1b[38;5;183m";
    pub const rose = "\x1b[38;5;205m";
    pub const reset = "\x1b[0m";
};

pub fn log(comptime format: []const u8, args: anytype) void {
    std.debug.print(Color.azure ++ format ++ Color.reset ++ "\n", args);
}

pub fn main() !void {
    log("🌟 BLOOM Bootloader - STARWEAVE Universe Edition v{s}", .{STARWEAVE.universe_version});
    log("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━", .{});

    const init_state = try spINIT.spINIT();
    try init_state.align();

    try spun.spun();
}

