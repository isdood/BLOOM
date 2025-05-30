# Fix compilation errors in BLOOM bootloader's error handling

## Current Behavior
The BLOOM bootloader is failing to compile with 6 errors, primarily related to error handling and state management:

1. In `spun/spun.zig`:
   ```zig
   try std.debug.print("🌟 STARWEAVE State Initialized\n", .{});
   ```
   Error: expected error union type, found 'void'

2. In `spINIT/spINIT.zig`:
   ```zig
   std.debug.print(format, args) catch |err| {
   ```
   Multiple instances of: expected error union type, found 'void'

3. State handling error in `spINIT/spINIT.zig`:
   ```zig
   .initializing => Color.sage ++ @tagName(self.state) ++ Color.reset,
   ```
   Error: unable to resolve comptime value

## Root Cause
1. `std.debug.print` in newer Zig versions doesn't return an error union type, making the `try` and `catch` operators invalid
2. The state tag name resolution needs to be handled at comptime

## Proposed Fix

1. For `spun/spun.zig`, remove the `try` operator since `std.debug.print` doesn't return an error:
```zig
std.debug.print("🌟 STARWEAVE State Initialized\n", .{});
```

2. For `spINIT/spINIT.zig`, remove the `catch` block since `std.debug.print` doesn't return an error:
```zig
std.debug.print(format, args);
```

3. For the state handling, ensure the state enum is comptime-known:
```zig
const stateName = @tagName(self.state);
return Color.sage ++ stateName ++ Color.reset;
```

## Additional STARWEAVE Universe Context
These changes align with the GLIMMER coloring system while maintaining the STARWEAVE state management patterns. The error handling modifications preserve the bootloader's role in the STARWEAVE universe while fixing the technical issues.

## Testing Plan
1. Compile the bootloader with the proposed changes
2. Verify that state initialization messages are properly displayed with GLIMMER coloring
3. Ensure STARWEAVE state transitions work as expected

## Related Files
- `spun/spun.zig`
- `spINIT/spINIT.zig`
- `bloom_bootloader.zig`
