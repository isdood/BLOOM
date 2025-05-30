
const std = @import("std");
const starweave = @import("starweave_constants");

pub const Color = starweave.Color;
pub const STARWEAVE = starweave.STARWEAVE;

pub const State = enum {
    initializing,
    quantum_sync,
    crystal_form,
    complete,

    pub fn toString(self: State) []const u8 {
        return switch (self) {
            .initializing => "initializing",
            .quantum_sync => "quantum_sync",
            .crystal_form => "crystal_form",
            .complete => "complete",
        };
    }
};

fn log(comptime format: []const u8, args: anytype) void {
    std.debug.print(Color.azure ++ format ++ Color.reset ++ "\n", args);
}

pub const InitializationState = struct {
    state: State,
    quantum_coherence: f32,
    crystal_resonance: f32,

    pub fn displayStatus(self: *InitializationState) !void {
        const state_str = self.state.toString();
        const status = switch (self.state) {
            .initializing => Color.sage ++ state_str ++ Color.reset,
            .quantum_sync => Color.azure ++ state_str ++ Color.reset,
            .crystal_form => Color.lavender ++ state_str ++ Color.reset,
            .complete => Color.rose ++ state_str ++ Color.reset,
        };
        log("✨ STARWEAVE State: {s}", .{status});
        self.state = .quantum_sync;
    }
};

pub fn spINIT() !InitializationState {
    return InitializationState{
        .state = .initializing,
        .quantum_coherence = STARWEAVE.quantum_stability,
        .crystal_resonance = STARWEAVE.crystal_resonance,
    };
}

