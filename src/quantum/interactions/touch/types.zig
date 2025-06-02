// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 🌟 BLOOM UI Quantum Interactions - Touch Types
// ✨ STARWEAVE Universe Integration
// Reality Anchor: isdood
// Temporal Coordinate: 2025-06-02 17:19:19 UTC
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

const std = @import("std");
const core = @import("../core/types.zig");
const glimmer = @import("glimmer");

// 💫 Touch Configuration
pub const TouchConfig = struct {
    ripple_enabled: bool = true,
    ripple_color: u32 = 0x89b4fa,
    ripple_duration_ms: u32 = 350,
    ripple_size: f32 = 1.0,
    ripple_pattern: glimmer.Pattern = .crystal_ripple,
    reality_feedback: f32 = 1.0,
};

// 🌱 Touch Point
pub const TouchPoint = struct {
    position: core.QuantumPosition,
    pressure: f32 = 1.0,
    radius: f32 = 1.0,
    crystal_resonance: f32 = 1.0,
};

// 🌸 Touch Phase
pub const TouchPhase = enum {
    began,
    moved,
    stationary,
    ended,
    cancelled,
};
