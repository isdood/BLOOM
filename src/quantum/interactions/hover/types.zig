// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 🌟 BLOOM UI Quantum Interactions - Hover Types
// ✨ STARWEAVE Universe Integration
// Reality Anchor: isdood
// Temporal Coordinate: 2025-06-02 17:33:52 UTC
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

const std = @import("std");
const core = @import("../core/types.zig");
const glimmer = @import("glimmer");

// 💫 Hover Configuration
pub const HoverConfig = struct {
    hover_enabled: bool = true,
    hover_highlight: bool = true,
    highlight_color: u32 = 0x89b4fa,
    highlight_pattern: glimmer.Pattern = .quantum_aura,
    crystal_resonance: f32 = 1.0,
    aura_size: f32 = 2.0,
    reality_shift: f32 = 0.5,
};

// 🌱 Hover State
pub const HoverState = struct {
    hovering: bool = false,
    reality_phase: f32 = 1.0,
    crystal_intensity: f32 = 1.0,
    quantum_aura: f32 = 1.0,
};

// 🌸 Hover Aura
pub const HoverAura = struct {
    position: core.QuantumPosition,
    dimensions: core.QuantumDimensions,
    intensity: f32 = 1.0,
    crystal_matrix: glimmer.Matrix,
};

// ⭐ Hover Interaction
pub const HoverInteraction = struct {
    enter_time: i64,
    last_move: i64,
    quantum_flow: f32,
    reality_anchor: []const u8,
};
