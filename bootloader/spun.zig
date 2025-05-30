
const std = @import("std");
const quantum = @import("quantum");
const crystal = @import("crystal");
const starweave = @import("starweave");

pub fn log(comptime format: []const u8, args: anytype) void {
    std.debug.print(Color.azure ++ format ++ Color.reset ++ "\n", args);
}

pub const Color = struct {
    pub const azure = "\x1b[38;5;39m";
    pub const reset = "\x1b[0m";
};

pub fn spun(comptime StarweaveMetrics: type) !void {
    log("🌟 STARWEAVE State Initialized", .{});
    _ = StarweaveMetrics;
}

