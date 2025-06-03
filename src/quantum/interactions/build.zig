const std = @import("std");

// 🌟 BLOOM UI Quantum Build System
// ✨ Part of the STARWEAVE Universe
// Reality Anchor: isdood
// Temporal Coordinate: 2025-06-03 03:31:07 UTC

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const quantum_mod = b.addModule("quantum", .{
        .root_source_file = .{ .cwd_relative = "../mod.zig" },
        .target = target,
        .optimize = optimize,
    });

    const glimmer_mod = b.addModule("glimmer", .{
        .root_source_file = .{ .cwd_relative = "../../glimmer/mod.zig" },
        .target = target,
        .optimize = optimize,
    });

    const tests = b.addTest(.{
        .root_source_file = .{ .cwd_relative = "tests/main_test.zig" },
        .target = target,
        .optimize = optimize,
    });

    tests.root_module.addImport("quantum", quantum_mod);
    tests.root_module.addImport("glimmer", glimmer_mod);

    const test_step = b.step("test", "Run quantum interaction tests");
    test_step.dependOn(&b.addRunArtifact(tests).step);
}
