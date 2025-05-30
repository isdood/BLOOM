
const std = @import("std");
const common = @import("common");

pub const Color = common.Color;
pub const STARWEAVE = common.STARWEAVE;

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

    pub fn getColor(self: State) []const u8 {
        return switch (self) {
            .initializing => Color.sage,
            .quantum_sync => Color.azure,
            .crystal_form => Color.lavender,
            .complete => Color.rose,
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
        const state_color = self.state.getColor();
        log("✨ STARWEAVE State: {s}{s}{s}", .{
            state_color,
            state_str,
            Color.reset
        });
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

