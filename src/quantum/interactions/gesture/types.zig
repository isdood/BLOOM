// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 🌟 BLOOM UI Quantum Interactions - Gesture Types
// ✨ STARWEAVE Universe Integration
// Reality Anchor: isdood
// Temporal Coordinate: 2025-06-02 17:26:02 UTC
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

const std = @import("std");
const core = @import("../core/types.zig");
const touch = @import("../touch/types.zig");
const glimmer = @import("glimmer");

// 💫 Gesture Configuration
pub const GestureConfig = struct {
    swipe_enabled: bool = true,
    pinch_enabled: bool = true,
    rotation_enabled: bool = true,
    pattern_recognition: glimmer.Pattern = .fluid_motion,
    crystal_tracking: f32 = 1.0,
    reality_threshold: f32 = 0.1,
    quantum_sensitivity: f32 = 1.0,
};

// 🌱 Gesture Type
pub const GestureType = enum {
    swipe,
    pinch,
    rotate,
    quantum_flow,
};

// 🌸 Gesture Vector
pub const GestureVector = struct {
    start: core.QuantumPosition,
    current: core.QuantumPosition,
    velocity: core.QuantumPosition,
    reality_flow: f32,
};

// ⭐ Gesture State
pub const GestureState = struct {
    type: GestureType,
    vector: GestureVector,
    scale: f32 = 1.0,
    rotation: f32 = 0.0,
    crystal_resonance: f32 = 1.0,
};
