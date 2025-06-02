// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 🌟 BLOOM UI Quantum Interactions - Hover Events
// ✨ STARWEAVE Universe Integration
// Reality Anchor: isdood
// Temporal Coordinate: 2025-06-02 17:33:52 UTC
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

const core = @import("../core/events.zig");
const types = @import("types.zig");

// 💫 Hover Event
pub const HoverEvent = struct {
    base: core.QuantumEvent,
    state: types.HoverState,
    aura: types.HoverAura,
    interaction: types.HoverInteraction,
};

// 🌱 Hover Change Event
pub const HoverChangeEvent = struct {
    hover: HoverEvent,
    previous_state: types.HoverState,
    reality_shift: f32,
    crystal_resonance: f32,
};

// 🌸 Hover Motion Event
pub const HoverMotionEvent = struct {
    hover: HoverEvent,
    velocity: core.QuantumPosition,
    quantum_flow: f32,
};
