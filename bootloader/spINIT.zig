
const std = @import("std");
const quantum = @import("quantum");
const crystal = @import("crystal");
const starweave = @import("starweave");

pub const Color = struct {
    pub const sage = "\x1b[38;5;71m";
    pub const azure = "\x1b[38;5;39m";
    pub const lavender = "\x1b[38;5;183m";
    pub const rose = "\x1b[38;5;205m";
    pub const reset = "\x1b[0m";
};

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

pub fn log(comptime format: []const u8, args: anytype) void {
    std.debug.print(Color.azure ++ format ++ Color.reset ++ "\n", args);
}

pub const InitializationState = struct {
    state: State = .initializing,
    quantum_coherence: f32 = 0.0,
    crystal_resonance: f32 = 0.0,

    pub fn displayStatus(self: *InitializationState) void {
        const state_str = self.state.toString();
        const status = switch (self.state) {
            .initializing => Color.sage ++ state_str ++ Color.reset,
            .quantum_sync => Color.azure ++ state_str ++ Color.reset,
            .crystal_form => Color.lavender ++ state_str ++ Color.reset,
            .complete => Color.rose ++ state_str ++ Color.reset,
        };
        log("✨ STARWEAVE State: {s}", .{status});
    }
};

pub fn spINIT() !InitializationState {
    var init_state = InitializationState{};
    init_state.displayStatus();
    return init_state;
}

