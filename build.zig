const std = @import("std");

// 🌟 BLOOM Main Build System
// ✨ Part of the STARWEAVE Universe
// Reality Anchor: isdood
// Temporal Coordinate: 2025-06-03 03:31:07 UTC

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const quantum_mod = b.addModule("quantum", .{
        .root_source_file = .{ .cwd_relative = "src/quantum/mod.zig" },
        .target = target,
        .optimize = optimize,
    });

    const glimmer_mod = b.addModule("glimmer", .{
        .root_source_file = .{ .cwd_relative = "src/glimmer/mod.zig" },
        .target = target,
        .optimize = optimize,
    });
}
