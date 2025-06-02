// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 🌟 BLOOM UI Quantum Interactions - Core Events
// ✨ STARWEAVE Universe Integration
// Reality Anchor: isdood
// Temporal Coordinate: 2025-06-02 17:15:13 UTC
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

const types = @import("types.zig");
const glimmer = @import("glimmer");

// 💫 Base Event
pub const QuantumEvent = struct {
    timestamp: i64,
    position: types.QuantumPosition,
    reality_phase: f32,
    crystal_resonance: f32,
};

// 🌱 State Change Event
pub const StateChangeEvent = struct {
    base: QuantumEvent,
    previous_state: types.InteractionState,
    new_state: types.InteractionState,
    transition_pattern: glimmer.Pattern,
};

// 🌸 Reality Sync Event
pub const RealitySyncEvent = struct {
    base: QuantumEvent,
    sync_level: f32,
    crystal_matrix: glimmer.Matrix,
    quantum_flow: f32,
};
