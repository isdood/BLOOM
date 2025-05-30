
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

    // Add module dependencies
    const quantum = b.addModule("quantum", .{
        .root_source_file = .{ .cwd_relative = "quantum.zig" },
        .dependencies = &.{},
    });
    const crystal = b.addModule("crystal", .{
        .root_source_file = .{ .cwd_relative = "crystal.zig" },
        .dependencies = &.{},
    });
    const starweave = b.addModule("starweave", .{
        .root_source_file = .{ .cwd_relative = "starweave.zig" },
        .dependencies = &.{},
    });

    exe.root_module.addImport("quantum", quantum);
    exe.root_module.addImport("crystal", crystal);
    exe.root_module.addImport("starweave", starweave);

    b.installArtifact(exe);
}

