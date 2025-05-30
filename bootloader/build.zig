
const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "bloom_bootloader",
        .root_source_file = .{ .path = "bloom_bootloader.zig" },
        .target = target,
        .optimize = optimize,
    });

    // Add module dependencies
    const quantum = b.addModule("quantum", .{
        .source_file = .{ .path = "quantum.zig" },
    });
    const crystal = b.addModule("crystal", .{
        .source_file = .{ .path = "crystal.zig" },
    });
    const starweave = b.addModule("starweave", .{
        .source_file = .{ .path = "starweave.zig" },
    });

    exe.addModule("quantum", quantum);
    exe.addModule("crystal", crystal);
    exe.addModule("starweave", starweave);

    b.installArtifact(exe);
}

