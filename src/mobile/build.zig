// STARWEAVE Universe - BLOOM Quantum Matrix
const std = @import("std");

pub fn build(b: *std.Build) void {
    // Initialize quantum field with pure resonance
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // Create executable with pure binding
    const exe = b.addExecutable(.{
        .name = "bloom-mobile-ui",
        .root_source_file = .{ .cwd_relative = "src/main.zig" },
        .target = target,
        .optimize = optimize,
    });

    // Install with pure harmony
    b.installArtifact(exe);

    // Create test module with pure quantum resonance
    const unit_tests = b.addTest(.{
        .root_source_file = .{ .cwd_relative = "src/main.zig" },
        .target = target,
        .optimize = optimize,
    });

    const run_unit_tests = b.addRunArtifact(unit_tests);
    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_unit_tests.step);

    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());
    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}
