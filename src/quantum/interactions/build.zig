const std = @import("std");

// 🌟 BLOOM UI Quantum Build System
// ✨ Part of the STARWEAVE Universe
// Reality Anchor: isdood
// Temporal Coordinate: 2025-06-03 03:13:55 UTC

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const quantum_mod = b.addModule("quantum", .{
        .source_file = .{ .path = "../mod.zig" },
    });

    const glimmer_mod = b.addModule("glimmer", .{
        .source_file = .{ .path = "../../glimmer/mod.zig" },
    });

    const tests = b.addTest(.{
        .root_source_file = .{ .path = "tests/main_test.zig" },
        .target = target,
        .optimize = optimize,
    });

    tests.addModule("quantum", quantum_mod);
    tests.addModule("glimmer", glimmer_mod);

    const test_step = b.step("test", "Run quantum interaction tests");
    test_step.dependOn(&tests.step);
}
