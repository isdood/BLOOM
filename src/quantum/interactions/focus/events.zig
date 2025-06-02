// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 🌟 BLOOM UI Quantum Interactions - Focus Events
// ✨ STARWEAVE Universe Integration
// Reality Anchor: isdood
// Temporal Coordinate: 2025-06-02 17:30:39 UTC
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

const core = @import("../core/events.zig");
const types = @import("types.zig");

// 💫 Focus Event
pub const FocusEvent = struct {
    base: core.QuantumEvent,
    state: types.FocusState,
    ring: types.FocusRing,
    navigation: ?types.FocusNavigation,
};

// 🌱 Focus Change Event
pub const FocusChangeEvent = struct {
    focus: FocusEvent,
    previous_state: types.FocusState,
    reality_shift: f32,
};

// 🌸 Focus Navigation Event
pub const FocusNavigationEvent = struct {
    focus: FocusEvent,
    navigation: types.FocusNavigation,
    quantum_shift: f32,
};
