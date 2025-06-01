# 🌟 BLOOM UI Examples

## ✨ Basic Examples

### Quantum Button

\`\`\`zig
const std = @import("std");
const quantum = @import("quantum");

pub fn main() !void {
    var button = try quantum.QuantumButton.init(std.heap.page_allocator);
    defer button.deinit();

    // Set up GLIMMER aesthetics
    try button.setPattern(.{
        .crystal_resonance = 0.95,
        .reality_anchor = 0.98,
    });
}
\`\`\`

### Quantum Layout

\`\`\`zig
var grid = try quantum.QuantumGrid.init(allocator, 3, 3);
defer grid.deinit();

// Add quantum-aligned widgets
try grid.add(button, .{ .row = 0, .col = 0 });
\`\`\`
