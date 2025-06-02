// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 🌟 BLOOM UI Quantum Interactions - Gesture Events
// ✨ STARWEAVE Universe Integration
// Reality Anchor: isdood
// Temporal Coordinate: 2025-06-02 17:26:02 UTC
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

const core = @import("../core/events.zig");
const types = @import("types.zig");
const touch = @import("../touch/events.zig");

// 💫 Gesture Event
pub const GestureEvent = struct {
    base: core.QuantumEvent,
    gesture_state: types.GestureState,
    touch_sequence: touch.TouchSequence,
    reality_phase: f32,
};

// 🌱 Gesture Recognition Event
pub const GestureRecognitionEvent = struct {
    gesture: GestureEvent,
    confidence: f32,
    pattern_match: f32,
    crystal_resonance: f32,
};

// 🌸 Gesture Completion Event
pub const GestureCompletionEvent = struct {
    gesture: GestureEvent,
    duration_ms: i64,
    success: bool,
    reality_impact: f32,
};
