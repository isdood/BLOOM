
const starweave = @import("starweave_constants.zig");
pub const STARWEAVE = starweave.STARWEAVE;
pub const Color = starweave.Color;

pub const version = STARWEAVE.universe_version;
pub const universe = "STARWEAVE";

pub const quantum_state = struct {
    pub const coherent = true;
    pub const entangled = true;
    pub const stability = STARWEAVE.quantum_stability;
};

