//! ✨ BLOOM Bootloader Build Configuration
//! Part of the STARWEAVE Universe
//! Author: Caleb J.D. Terkovics (@isdood)
//! Created: 2025-05-30 12:24:36 UTC

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
        .root_source_file = .{ .path = "bloom_bootloader.zig" },
        .target = target,
        .optimize = optimize,
    });

    // 🌸 Add module dependencies with crystal-lattice alignment
    const quantum_mod = b.addModule("quantum", .{
        .source_file = .{ .path = "quantum.zig" },
    });
    exe.addModule("quantum", quantum_mod);

    const crystal_mod = b.addModule("crystal", .{
        .source_file = .{ .path = "crystal.zig" },
    });
    exe.addModule("crystal", crystal_mod);

    const starweave_mod = b.addModule("starweave", .{
        .source_file = .{ .path = "starweave.zig" },
    });
    exe.addModule("starweave", starweave_mod);

    // 🌟 Add stage modules
    const spinit_mod = b.addModule("spINIT", .{
        .source_file = .{ .path = "spINIT/spINIT.zig" },
        .dependencies = &.{
            .{ .name = "quantum", .module = quantum_mod },
            .{ .name = "crystal", .module = crystal_mod },
            .{ .name = "starweave", .module = starweave_mod },
        },
    });
    exe.addModule("spINIT", spinit_mod);

    const spinup_mod = b.addModule("spinUP", .{
        .source_file = .{ .path = "spinUP/spinUP.zig" },
        .dependencies = &.{
            .{ .name = "quantum", .module = quantum_mod },
            .{ .name = "crystal", .module = crystal_mod },
            .{ .name = "starweave", .module = starweave_mod },
        },
    });
    exe.addModule("spinUP", spinup_mod);

    const spun_mod = b.addModule("spun", .{
        .source_file = .{ .path = "spun/spun.zig" },
        .dependencies = &.{
            .{ .name = "quantum", .module = quantum_mod },
            .{ .name = "crystal", .module = crystal_mod },
            .{ .name = "starweave", .module = starweave_mod },
        },
    });
    exe.addModule("spun", spun_mod);

    // 💫 Install with quantum alignment
    b.installArtifact(exe);

    // 🔮 Create run command with crystal resonance
    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());

    // ⚡ Create run step
    const run_step = b.step("run", "Execute the BLOOM bootloader with STARWEAVE integration");
    run_step.dependOn(&run_cmd.step);

    // 🌸 Add test step with GLIMMER integration
    const unit_tests = b.addTest(.{
        .root_source_file = .{ .path = "bloom_bootloader.zig" },
        .target = target,
        .optimize = optimize,
    });

    const run_unit_tests = b.addRunArtifact(unit_tests);
    const test_step = b.step("test", "Run BLOOM bootloader unit tests with quantum verification");
    test_step.dependOn(&run_unit_tests.step);
}

