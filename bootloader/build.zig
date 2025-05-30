//! ✨ BLOOM Bootloader Build Configuration
//! Part of the STARWEAVE Universe
//! Author: Caleb J.D. Terkovics (@isdood)
//! Created: 2025-05-30 13:07:32 UTC

const std = @import("std");

// 🌟 STARWEAVE build configuration
pub fn build(b: *std.Build) void {
    // 💫 Add STARWEAVE standard target options
    const target = b.standardTargetOptions(.{});

    // 🔮 Add STARWEAVE optimization options
    const optimize = b.standardOptimizeOption(.{});

    // ⚡ Create main executable with quantum coherence
    const exe = b.addExecutable(.{
        .name = "bloom_bootloader",
        .root_source_file = .{ .cwd_relative = "bloom_bootloader.zig" },
        .target = target,
        .optimize = optimize,
    });

    // 🌸 Add module dependencies with crystal-lattice alignment
    const quantum_mod = b.createModule(.{
        .root_source_file = .{ .cwd_relative = "quantum.zig" },
    });
    exe.addModule("quantum", quantum_mod);

    const crystal_mod = b.createModule(.{
        .root_source_file = .{ .cwd_relative = "crystal.zig" },
    });
    exe.addModule("crystal", crystal_mod);

    const starweave_mod = b.createModule(.{
        .root_source_file = .{ .cwd_relative = "starweave.zig" },
    });
    exe.addModule("starweave", starweave_mod);

    // 🌟 Add stage modules with enhanced quantum alignment
    const spinit_mod = b.createModule(.{
        .root_source_file = .{ .cwd_relative = "spINIT/spINIT.zig" },
        .dependencies = &.{
            .{ .name = "quantum", .module = quantum_mod },
            .{ .name = "crystal", .module = crystal_mod },
            .{ .name = "starweave", .module = starweave_mod },
        },
    });
    exe.addModule("spINIT", spinit_mod);

    const spinup_mod = b.createModule(.{
        .root_source_file = .{ .cwd_relative = "spinUP/spinUP.zig" },
        .dependencies = &.{
            .{ .name = "quantum", .module = quantum_mod },
            .{ .name = "crystal", .module = crystal_mod },
            .{ .name = "starweave", .module = starweave_mod },
        },
    });
    exe.addModule("spinUP", spinup_mod);

    const spun_mod = b.createModule(.{
        .root_source_file = .{ .cwd_relative = "spun/spun.zig" },
        .dependencies = &.{
            .{ .name = "quantum", .module = quantum_mod },
            .{ .name = "crystal", .module = crystal_mod },
            .{ .name = "starweave", .module = starweave_mod },
        },
    });
    exe.addModule("spun", spun_mod);

    // 💫 Install with enhanced quantum alignment
    b.installArtifact(exe);

    // 🔮 Create run command with crystal resonance
    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());

    // ⚡ Create run step with STARWEAVE integration
    const run_step = b.step("run", "Execute the BLOOM bootloader with STARWEAVE integration");
    run_step.dependOn(&run_cmd.step);

    // 🌸 Add test step with enhanced GLIMMER integration
    const unit_tests = b.addTest(.{
        .root_source_file = .{ .cwd_relative = "bloom_bootloader.zig" },
        .target = target,
        .optimize = optimize,
    });

    const run_unit_tests = b.addRunArtifact(unit_tests);
    const test_step = b.step("test", "Run BLOOM bootloader unit tests with quantum verification");
    test_step.dependOn(&run_unit_tests.step);
}
