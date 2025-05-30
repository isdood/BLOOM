
const constants = @import("starweave_constants.zig");
pub const STARWEAVE = constants.STARWEAVE;
pub const Color = constants.Color;

pub const version = STARWEAVE.universe_version;
pub const universe = "STARWEAVE";

pub const weave_state = struct {
    pub const connected = STARWEAVE.universe_sync;
    pub const synchronized = true;
    pub const flow = 1.0;
};

