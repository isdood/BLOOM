
const std = @import("std");
const common = @import("common");

pub const Color = common.Color;
pub const STARWEAVE = common.STARWEAVE;

pub fn log(comptime format: []const u8, args: anytype) void {
    std.debug.print(Color.azure ++ format ++ Color.reset ++ "\n", args);
}

pub const quantum_state = struct {
    pub const coherent = true;
    pub const entangled = true;
    pub const stability = STARWEAVE.quantum_stability;

    pub fn status() void {
        log("⟡ Quantum Coherence: {d:.2}", .{stability});
    }
};

