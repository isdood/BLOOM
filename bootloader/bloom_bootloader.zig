
const std = @import("std");
const quantum = @import("quantum");
const crystal = @import("crystal");
const starweave = @import("starweave");
const spINIT = @import("./spINIT.zig");
const spun = @import("./spun.zig");

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
    log("🌟 BLOOM Bootloader - STARWEAVE Universe Edition", .{});
    log("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━", .{});

    var init_state = try spINIT.spINIT();
    _ = init_state;

    try spun.spun(.{});
}

