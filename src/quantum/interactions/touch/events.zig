// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 🌟 BLOOM UI Quantum Interactions - Touch Events
// ✨ STARWEAVE Universe Integration
// Reality Anchor: isdood
// Temporal Coordinate: 2025-06-02 17:19:19 UTC
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

const core = @import("../core/events.zig");
const types = @import("types.zig");

// 💫 Touch Event
pub const TouchEvent = struct {
    base: core.QuantumEvent,
    phase: types.TouchPhase,
    touch_point: types.TouchPoint,
    timestamp_ms: i64,
};

// 🌱 Touch Sequence
pub const TouchSequence = struct {
    id: u64,
    events: std.ArrayList(TouchEvent),
    start_time: i64,
    reality_phase: f32,
};

// 🌸 Ripple Event
pub const RippleEvent = struct {
    touch: TouchEvent,
    config: types.TouchConfig,
    crystal_matrix: glimmer.Matrix,
};
