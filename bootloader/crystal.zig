
const std = @import("std");
const common = @import("common");

pub const Color = common.Color;
pub const STARWEAVE = common.STARWEAVE;

pub fn log(comptime format: []const u8, args: anytype) void {
    std.debug.print(Color.lavender ++ format ++ Color.reset ++ "\n", args);
}

pub const crystal_state = struct {
    pub const resonating = true;
    pub const aligned = true;
    pub const harmony = STARWEAVE.crystal_resonance;

    pub fn status() void {
        log("⟡ Crystal Resonance: {d:.2}", .{harmony});
    }
};

