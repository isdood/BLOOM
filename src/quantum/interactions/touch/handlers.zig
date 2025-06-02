// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 🌟 BLOOM UI Quantum Interactions - Touch Handlers
// ✨ STARWEAVE Universe Integration
// Reality Anchor: isdood
// Temporal Coordinate: 2025-06-02 17:19:19 UTC
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

const std = @import("std");
const core = @import("../core/handlers.zig");
const types = @import("types.zig");
const events = @import("events.zig");
const glimmer = @import("glimmer");

// 💫 Touch Handler
pub const TouchHandler = struct {
    core: *core.CoreHandler,
    config: types.TouchConfig,
    active_sequences: std.AutoHashMap(u64, events.TouchSequence),
    crystal_matrix: glimmer.Matrix,

    const Self = @This();

    pub fn init(allocator: std.mem.Allocator, core_handler: *core.CoreHandler) !*Self {
        const handler = try allocator.create(Self);
        handler.* = .{
            .core = core_handler,
            .config = types.TouchConfig{},
            .active_sequences = std.AutoHashMap(u64, events.TouchSequence).init(allocator),
            .crystal_matrix = glimmer.Matrix{},
        };
        return handler;
    }

    pub fn handleTouch(self: *Self, event: events.TouchEvent) !void {
        switch (event.phase) {
            .began => try self.handleTouchBegan(event),
            .moved => try self.handleTouchMoved(event),
            .ended => try self.handleTouchEnded(event),
            .cancelled => try self.handleTouchCancelled(event),
            else => {},
        }

        if (self.config.ripple_enabled) {
            try self.createRipple(event);
        }
    }

    fn createRipple(self: *Self, event: events.TouchEvent) !void {
        const ripple = events.RippleEvent{
            .touch = event,
            .config = self.config,
            .crystal_matrix = self.crystal_matrix,
        };

        try self.crystal_matrix.applyPattern(self.config.ripple_pattern, .{
            .position = event.touch_point.position,
            .color = self.config.ripple_color,
            .duration = self.config.ripple_duration_ms,
            .size = self.config.ripple_size,
        });
    }
};
