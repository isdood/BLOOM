
const std = @import("std");
const common = @import("common");
const quantum = @import("quantum");
const quantum_state = @import("quantum_state.zig");

pub const Color = common.Color;
pub const STARWEAVE = common.STARWEAVE;
pub const StateType = quantum_state.StateType;
pub const QuantumStateEvent = quantum_state.QuantumStateEvent;

pub const EventSpecs = struct {
    // Event parameters
    pub const max_events: usize = 256;
    pub const max_listeners: usize = 32;
    pub const event_buffer_size: usize = 128;

    // Quantum thresholds
    pub const propagation_speed: f32 = 0.95;
    pub const quantum_coupling: f32 = 0.88;
    pub const reality_influence: f32 = 0.92;
};

pub const EventListener = struct {
    callback: *const fn(*QuantumEvent) void,
    filter: ?EventFilter,
    quantum_sensitivity: f32,
    reality_anchor: []const u8,
};

pub const EventFilter = struct {
    state_types: []const StateType,
    min_coherence: f32,
    min_entanglement: f32,
    min_resonance: f32,
};

pub const QuantumEvent = struct {
    id: u64,
    state_event: QuantumStateEvent,
    propagation_strength: f32,
    reality_impact: f32,
    temporal_signature: i64,
    source_anchor: []const u8,

    pub fn init(state_event: QuantumStateEvent) QuantumEvent {
        return .{
            .id = generateEventId(),
            .state_event = state_event,
            .propagation_strength = EventSpecs.propagation_speed,
            .reality_impact = EventSpecs.reality_influence,
            .temporal_signature = std.time.timestamp(),
            .source_anchor = STARWEAVE.reality_anchor,
        };
    }

    fn generateEventId() u64 {
        return @bitCast(u64, std.time.timestamp() ^
            @floatToInt(i64, STARWEAVE.quantum_stability * 1_000_000_000.0));
    }
};

pub const EventBuffer = struct {
    events: std.ArrayList(QuantumEvent),
    temporal_map: std.AutoHashMap(i64, usize),
    allocator: std.mem.Allocator,

    pub fn init(allocator: std.mem.Allocator) !EventBuffer {
        return EventBuffer{
            .events = std.ArrayList(QuantumEvent).init(allocator),
            .temporal_map = std.AutoHashMap(i64, usize).init(allocator),
            .allocator = allocator,
        };
    }

    pub fn deinit(self: *EventBuffer) void {
        self.events.deinit();
        self.temporal_map.deinit();
    }

    pub fn recordEvent(self: *EventBuffer, event: QuantumEvent) !void {
        try self.events.append(event);
        try self.temporal_map.put(event.temporal_signature, self.events.items.len - 1);

        if (self.events.items.len > EventSpecs.event_buffer_size) {
            _ = self.events.orderedRemove(0);
            try self.reindexTemporalMap();
        }
    }

    fn reindexTemporalMap(self: *EventBuffer) !void {
        self.temporal_map.clearRetainingCapacity();
        for (self.events.items) |event, i| {
            try self.temporal_map.put(event.temporal_signature, i);
        }
    }
};

pub const QuantumEventManager = struct {
    listeners: std.ArrayList(EventListener),
    event_buffer: EventBuffer,
    quantum_coupling: f32,
    temporal_coordinate: i64,
    reality_anchor: []const u8,
    allocator: std.mem.Allocator,

    const Self = @This();

    pub fn init(allocator: std.mem.Allocator, reality_anchor: []const u8) !Self {
        return Self{
            .listeners = std.ArrayList(EventListener).init(allocator),
            .event_buffer = try EventBuffer.init(allocator),
            .quantum_coupling = EventSpecs.quantum_coupling,
            .temporal_coordinate = std.time.timestamp(),
            .reality_anchor = reality_anchor,
            .allocator = allocator,
        };
    }

    pub fn deinit(self: *Self) void {
        self.listeners.deinit();
        self.event_buffer.deinit();
    }

    pub fn addEventListener(self: *Self, listener: EventListener) !void {
        if (self.listeners.items.len >= EventSpecs.max_listeners) {
            return error.TooManyListeners;
        }

        try self.listeners.append(listener);
    }

    pub fn dispatchEvent(self: *Self, state_event: QuantumStateEvent) !void {
        var event = QuantumEvent.init(state_event);
        try self.event_buffer.recordEvent(event);

        var propagation_count: usize = 0;
        for (self.listeners.items) |listener| {
            if (self.shouldPropagateToListener(&event, &listener)) {
                listener.callback(&event);
                propagation_count += 1;
            }
        }

        log("{s}⟡ Event {d} propagated to {d} listeners{s}", .{
            Color.azure,
            event.id,
            propagation_count,
            Color.reset,
        });

        try self.validateEventPropagation(event);
    }

    fn shouldPropagateToListener(self: *Self, event: *const QuantumEvent, listener: *const EventListener) bool {
        if (listener.filter) |filter| {
            // Check if event type matches filter
            var type_match = false;
            for (filter.state_types) |allowed_type| {
                if (event.state_event.state_type == allowed_type) {
                    type_match = true;
                    break;
                }
            }
            if (!type_match) return false;

            // Check quantum thresholds
            if (event.state_event.coherence < filter.min_coherence or
                event.state_event.entanglement < filter.min_entanglement or
                event.state_event.resonance < filter.min_resonance) {
                return false;
            }
        }

        return true;
    }

    fn validateEventPropagation(self: *Self, event: QuantumEvent) !void {
        const reality_threshold = EventSpecs.reality_influence * self.quantum_coupling;

        if (event.reality_impact < reality_threshold) {
            log("{s}⚠ Warning: Event reality impact below threshold{s}", .{
                Color.rose,
                Color.reset,
            });
            try self.reinforceRealityAnchor();
        }
    }

    fn reinforceRealityAnchor(self: *Self) !void {
        log("{s}⟡ Reinforcing reality anchor...{s}", .{
            Color.lavender,
            Color.reset,
        });

        self.quantum_coupling = EventSpecs.quantum_coupling;
        self.temporal_coordinate = std.time.timestamp();
    }

    pub fn reportEventStatus(self: *Self) void {
        log("{s}⟡ Quantum Event System Status:{s}", .{
            Color.azure,
            Color.reset,
        });

        log("{s}⟡ Active Listeners: {d}{s}", .{
            Color.lavender,
            self.listeners.items.len,
            Color.reset,
        });

        log("{s}⟡ Buffered Events: {d}{s}", .{
            Color.sage,
            self.event_buffer.events.items.len,
            Color.reset,
        });

        log("{s}⟡ Quantum Coupling: {d:.3}{s}", .{
            Color.azure,
            self.quantum_coupling,
            Color.reset,
        });
    }
};

// Debug logging with GLIMMER aesthetics
fn log(comptime format: []const u8, args: anytype) void {
    std.debug.print(Color.azure ++ format ++ Color.reset ++ "\n", args);
}

