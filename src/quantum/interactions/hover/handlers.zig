// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 🌟 BLOOM UI Quantum Interactions - Hover Handlers
// ✨ STARWEAVE Universe Integration
// Reality Anchor: isdood
// Temporal Coordinate: 2025-06-02 17:33:52 UTC
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

const std = @import("std");
const core = @import("../core/handlers.zig");
const types = @import("types.zig");
const events = @import("events.zig");
const glimmer = @import("glimmer");

// 💫 Hover Handler
pub const HoverHandler = struct {
    core: *core.CoreHandler,
    config: types.HoverConfig,
    state: types.HoverState,
    aura: types.HoverAura,
    crystal_matrix: glimmer.Matrix,

    const Self = @This();

    pub fn init(allocator: std.mem.Allocator, core_handler: *core.CoreHandler) !*Self {
        const handler = try allocator.create(Self);
        handler.* = .{
            .core = core_handler,
            .config = types.HoverConfig{},
            .state = types.HoverState{},
            .aura = types.HoverAura{
                .position = .{ .x = 0, .y = 0, .z = 0 },
                .dimensions = .{ .width = 0, .height = 0 },
                .crystal_matrix = glimmer.Matrix{},
            },
            .crystal_matrix = glimmer.Matrix{},
        };
        return handler;
    }

    pub fn handleHover(self: *Self, event: events.HoverEvent) !void {
        if (self.config.hover_highlight) {
            try self.updateHoverAura(event);
        }

        try self.handleHoverChange(events.HoverChangeEvent{
            .hover = event,
            .previous_state = self.state,
            .reality_shift = self.config.reality_shift,
            .crystal_resonance = self.config.crystal_resonance,
        });
    }

    fn updateHoverAura(self: *Self, event: events.HoverEvent) !void {
        self.aura = event.aura;
        try self.crystal_matrix.applyPattern(self.config.highlight_pattern, .{
            .position = event.aura.position,
            .color = self.config.highlight_color,
            .size = self.config.aura_size,
            .resonance = self.config.crystal_resonance,
        });
    }

    fn handleHoverChange(self: *Self, event: events.HoverChangeEvent) !void {
        self.state = event.hover.state;
        try self.crystal_matrix.applyPattern(.quantum_shift, .{
            .intensity = event.reality_shift,
            .resonance = event.crystal_resonance,
        });
    }
};
