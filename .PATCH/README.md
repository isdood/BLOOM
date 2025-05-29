# .PATCH Directory

This folder houses numeric patch scripts that incrementally update and configure BLOOM components under the STARWEAVE universe. Each script (e.g., “000-PATCH.fish”) executes in numerical order by the main PATCH.fish manager to maintain BLOOM’s integrity, GLIMMER color mappings, and universal coherence.

## Purpose

1. Scripts in this folder are detected and run automatically by PATCH.fish.  
2. Each patch script grants itself “execute” permissions, applies the necessary updates, is then reverted to non-executable, and archived into .PATCH/HISTORY.  
3. This ensures a clean audit trail of all historical changes and reduces security risks.

## Usage Notes

• Add new patches here, naming them “NNN-PATCH.fish” (lowest N first).  
• Run PATCH.fish (with Fish shell) to apply each patch in ascending order.  
• Completed patches move to .PATCH/HISTORY, ensuring you can track all previously applied updates.

## File Structure

```
./.PATCH/
├── 000-PATCH.fish          # Example initial patch script
├── 001-PATCH.fish          # Next patch script in ascending sequence
├── HISTORY/                # Directory for storing executed patches
└── README.md               # This explanatory document
```

Everything here aligns with the aesthetic elements and cosmic theming used throughout BLOOM.
