
const std = @import("std");
const common = @import("common");
const spINIT = @import("spINIT");

pub const Color = common.Color;
pub const STARWEAVE = common.STARWEAVE;

fn log(comptime format: []const u8, args: anytype) void {
    std.debug.print(Color.azure ++ format ++ Color.reset ++ "\n", args);
}

pub fn spun(state: *spINIT.InitializationState) !void {
    log("🌟 STARWEAVE State Initialized", .{});
    log("⟡ Quantum Coherence: {d:.2}", .{state.quantum_coherence});
    log("⟡ Crystal Resonance: {d:.2}", .{state.crystal_resonance});
    state.state = .complete;
}

