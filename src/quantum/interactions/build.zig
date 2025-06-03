const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const quantum_pkg = std.build.Pkg{
        .name = "quantum",
        .source = .{ .path = "src/quantum/mod.zig" },
    };

    const glimmer_pkg = std.build.Pkg{
        .name = "glimmer",
        .source = .{ .path = "src/glimmer/mod.zig" },
    };

    const test_step = b.step("test", "Run quantum interaction tests");
    const tests = b.addTest(.{
        .root_source_file = .{ .path = "tests/main_test.zig" },
        .target = target,
        .optimize = optimize,
    });

    tests.addPackage(quantum_pkg);
    tests.addPackage(glimmer_pkg);
    test_step.dependOn(&tests.step);
}
