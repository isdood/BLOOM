
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

    // Create modules
    const common = b.createModule(.{
        .root_source_file = .{ .cwd_relative = "common.zig" },
    });

    const quantum = b.createModule(.{
        .root_source_file = .{ .cwd_relative = "quantum.zig" },
        .imports = &.{
            .{ .name = "common", .module = common },
        },
    });

    const crystal = b.createModule(.{
        .root_source_file = .{ .cwd_relative = "crystal.zig" },
        .imports = &.{
            .{ .name = "common", .module = common },
        },
    });

    const starweave = b.createModule(.{
        .root_source_file = .{ .cwd_relative = "starweave.zig" },
        .imports = &.{
            .{ .name = "common", .module = common },
        },
    });

    const spINIT = b.createModule(.{
        .root_source_file = .{ .cwd_relative = "spINIT.zig" },
        .imports = &.{
            .{ .name = "common", .module = common },
        },
    });

    const spun = b.createModule(.{
        .root_source_file = .{ .cwd_relative = "spun.zig" },
        .imports = &.{
            .{ .name = "common", .module = common },
            .{ .name = "spINIT", .module = spINIT },
        },
    });

    // Add module imports
    exe.root_module.addImport("common", common);
    exe.root_module.addImport("quantum", quantum);
    exe.root_module.addImport("crystal", crystal);
    exe.root_module.addImport("starweave", starweave);
    exe.root_module.addImport("spINIT", spINIT);
    exe.root_module.addImport("spun", spun);

    b.installArtifact(exe);
}

