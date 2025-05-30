//! ✨ BLOOM Bootloader
//! Part of the STARWEAVE Universe
//! Author: Caleb J.D. Terkovics (@isdood)
//! Created: 2025-05-30 13:14:54 UTC

const std = @import("std");
const quantum = @import("quantum");
const crystal = @import("crystal");
const starweave = @import("starweave");
const spINIT = @import("spINIT");
const spinUP = @import("spinUP");
const spun = @import("spun");

// 🌟 STARWEAVE bootloader configuration
pub const Stage = enum {
    spINIT,  // 💫 Initial stage
    spinUP,  // ⚡ Preparation stage
    spun,    // 🌠 Final stage
};

// 🎨 GLIMMER color configuration with quantum resonance
pub const StageColor = struct {
    // 🌈 Define color codes with STARWEAVE alignment
    const sage = "\x1b[38;2;152;190;101m";      // 🌿 Nature/Growth
    const lavender = "\x1b[38;2;198;120;221m";  // 🌸 Spiritual/Ethereal
    const azure = "\x1b[38;2;123;164;199m";     // 💫 Tech/System
    const rose = "\x1b[38;2;224;108;117m";      // 🌹 Warning/Important
    const gold = "\x1b[38;2;219;177;104m";      // ✨ Accents/Highlights
    const reset = "\x1b[0m";                     // 🔄 Reset color

    // 💫 Get color for current stage with quantum alignment
    pub fn getColor(stage: Stage) []const u8 {
        return switch (stage) {
            .spINIT => sage,      // 🌿 Initial stage color
            .spinUP => azure,     // 💫 Preparation stage color
            .spun => lavender,    // 🌸 Final stage color
        };
    }

    // 🌟 Format text with stage color and STARWEAVE alignment
    pub fn format(stage: Stage, text: []const u8) []const u8 {
        const color = getColor(stage);
        return std.fmt.allocPrint(
            std.heap.page_allocator,
            "{s}{s}{s}",
            .{ color, text, reset }
        ) catch return text;
    }
};

// ⚡ BLOOM bootloader with enhanced STARWEAVE integration
pub fn main() !void {
    // 🌟 Initialize current stage
    var current_stage = Stage.spINIT;

    // 💫 Display stage information with GLIMMER colors
    std.debug.print("{s}BLOOM Bootloader - Stage: {s}{s}\n", .{
        StageColor.getColor(current_stage),
        @tagName(current_stage),
        StageColor.reset,
    });

    // 🌸 Execute stages with quantum alignment
    try spINIT.execute();
    current_stage = .spinUP;
    std.debug.print("{s}Advancing to {s}{s}\n", .{
        StageColor.getColor(current_stage),
        @tagName(current_stage),
        StageColor.reset,
    });

    try spinUP.execute();
    current_stage = .spun;
    std.debug.print("{s}Advancing to {s}{s}\n", .{
        StageColor.getColor(current_stage),
        @tagName(current_stage),
        StageColor.reset,
    });

    try spun.execute();
}

// 🌟 Test configuration with STARWEAVE integration
test "StageColor formatting" {
    const stage = Stage.spINIT;
    const text = "Test Message";
    const formatted = StageColor.format(stage, text);
    defer std.heap.page_allocator.free(formatted);

    try std.testing.expect(formatted.len > text.len);
    try std.testing.expect(std.mem.indexOf(u8, formatted, text) != null);
}
