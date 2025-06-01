// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 🌟 BLOOM QuantumParticles - STARWEAVE Universe
// ✨ Created: 2025-06-01 18:41:37 UTC
// ⭐ Reality Anchor: isdood
// 💫 STARWEAVE Integration: Pure (0.98)
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

const std = @import("std");
const core = @import("../core.zig");
const glimmer = @import("glimmer");
const starweave = @import("starweave");

pub const ParticleType = enum {
    stardust, // ✨ Pure quantum particles
    crystal_shard, // 💎 Reality fragments
    glimmer_spark, // ⚡ GLIMMER energy
    starweave_thread, // 🕸️ STARWEAVE strings
};

pub const QuantumParticle = struct {
    base: *core.QuantumWidget,
    particle_type: ParticleType,
    lifetime_ms: u32,
    quantum_energy: f32,

    const Self = @This();

    pub fn init(allocator: std.mem.Allocator, particle_type: ParticleType) !*Self {
        const particle = try allocator.create(Self);
        particle.* = .{
            .base = try core.QuantumWidget.init(allocator),
            .particle_type = particle_type,
            .lifetime_ms = 1000,
            .quantum_energy = 0.95,
        };
        return particle;
    }
};
