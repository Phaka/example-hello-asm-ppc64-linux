# PowerPC64 assembly for Linux
# System calls for PowerPC64 Linux:
# 4 for write
# 1 for exit

        .section ".text"
        .align 2
        .global _start
_start:
        # Write system call
        li      0,4             # System call number for write
        li      3,1             # File descriptor 1 is stdout
        lis     4,message@ha    # Load high adjusted part of address
        addi    4,4,message@l   # Add low part to complete address
        li      5,14            # Message length
        sc                      # Make system call

        # Exit system call
        li      0,1             # System call number for exit
        li      3,0             # Return code 0
        sc                      # Make system call

        .section ".rodata"
        .align 2
message:
        .ascii "Hello, World!\n"
