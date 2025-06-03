const std = @import("std");

// 🌟 BLOOM Main Build System
// ✨ Part of the STARWEAVE Universe
// Reality Anchor: isdood
// Temporal Coordinate: 2025-06-03 03:17:02 UTC

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    _ = b.addModule("quantum", .{
        .source = .{ .path = "src/quantum/mod.zig" },
    });

    _ = b.addModule("glimmer", .{
        .source = .{ .path = "src/glimmer/mod.zig" },
    });
}
