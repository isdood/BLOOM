
const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "bloom_bootloader",
        .root_source_file = .{ .cwd_relative = "bloom_bootloader.zig" },
        .target = target,
        .optimize = optimize,
    });

    const starweave_constants = b.createModule(.{
        .root_source_file = .{ .cwd_relative = "starweave_constants.zig" },
    });

    const quantum = b.createModule(.{
        .root_source_file = .{ .cwd_relative = "quantum.zig" },
    });

    const crystal = b.createModule(.{
        .root_source_file = .{ .cwd_relative = "crystal.zig" },
    });

    const starweave = b.createModule(.{
        .root_source_file = .{ .cwd_relative = "starweave.zig" },
    });

    exe.addModule("starweave_constants", starweave_constants);
    exe.addModule("quantum", quantum);
    exe.addModule("crystal", crystal);
    exe.addModule("starweave", starweave);

    b.installArtifact(exe);
}

