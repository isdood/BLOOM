
const common = @import("common");
pub const Color = common.Color;
pub const STARWEAVE = common.STARWEAVE;

pub const version = STARWEAVE.universe_version;
pub const universe = "STARWEAVE";

pub const weave_state = struct {
    pub const connected = STARWEAVE.universe_sync;
    pub const synchronized = true;
    pub const flow = 1.0;
};

