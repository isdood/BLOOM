
const common = @import("common");
pub const Color = common.Color;

pub const version = common.STARWEAVE.universe_version;
pub const universe = "STARWEAVE";

pub const quantum_state = struct {
    pub const coherent = true;
    pub const entangled = true;
    pub const stability = common.STARWEAVE.quantum_stability;
};

