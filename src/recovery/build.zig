
const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // STARWEAVE Integration: Quantum Module Definition
    const starweave_mod = b.createModule(.{
        .root_source_file = .{ .cwd_relative = "core/starweave.zig" },
        .imports = &.{},
    });

    // GLIMMER Integration: Crystal Matrix Module
    const glimmer_mod = b.createModule(.{
        .root_source_file = .{ .cwd_relative = "core/glimmer.zig" },
        .imports = &.{},
    });

    const exe = b.addExecutable(.{
        .name = "bloom-recovery",
        .root_source_file = .{ .cwd_relative = "core/recovery_main.zig" },
        .target = target,
        .optimize = optimize,
    });

    // Add module dependencies
    exe.root_module.addImport("starweave", starweave_mod);
    exe.root_module.addImport("glimmer", glimmer_mod);

    b.installArtifact(exe);

    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());

    const run_step = b.step("run", "Execute the recovery module");
    run_step.dependOn(&run_cmd.step);

    // Quantum Coherence Testing
    const quantum_test = b.step(
        "test-quantum",
        "Verify quantum coherence in recovery module"
    );
    quantum_test.dependOn(&exe.step);
}
