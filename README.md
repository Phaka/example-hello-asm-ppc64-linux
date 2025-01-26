# Hello World in PowerPC64 Assembly (Linux)

A simple Hello World implementation in PowerPC64 assembly language for Linux systems. The PowerPC architecture, originally developed by the Apple-IBM-Motorola alliance, represents a clean RISC design with particular attention to symmetrical multiprocessing capabilities.

## Installation

On a PowerPC64 Linux system, you'll need the standard GNU toolchain:

```bash
sudo apt-get update
sudo apt-get install binutils gcc
```

## Running

Assemble and link:
```bash
as -o main.o main.s
ld -o hello main.o
./hello
```

## Code Explanation

The PowerPC64 implementation demonstrates several interesting architectural features that distinguish it from other RISC designs. PowerPC uses a numbered register set similar to MIPS, but with its own unique conventions and addressing modes.

Let's explore how PowerPC64 handles various aspects of program execution:

### Register Usage
PowerPC64 follows specific register conventions:
- Register 0 holds the system call number
- Registers 3-5 hold system call parameters
- The architecture provides 32 general-purpose registers (GPRs)
- Additional registers exist for floating-point and vector operations (not used in this example)

### Memory Addressing
PowerPC64 uses a distinctive approach to address loading:
1. The 'lis' instruction loads the high-adjusted part of an address
2. The 'addi' instruction adds the low part to complete the address
This two-part loading is necessary because PowerPC instructions are fixed-width (32 bits), but addresses are 64 bits.

### System Calls
PowerPC64 Linux uses a straightforward system call convention:
- System call numbers are loaded into register 0
- Parameters go into registers 3 and up
- The 'sc' (System Call) instruction triggers the system call
- System call numbers are simpler than some architectures (4 for write, 1 for exit)

### Memory Organization
The program separates code and data using sections:
- .text section contains the executable code
- .rodata section contains read-only data (our message)
- .align directives ensure proper instruction alignment

### Historical Context
PowerPC's design reflects its original purpose as a high-performance processor for desktop computers and servers. While it has largely been replaced by x86-64 and ARM64 in the desktop space, PowerPC64 continues to see use in embedded systems and some specialized computing applications.

The architecture's emphasis on clean design and multiprocessing support is evident even in this simple example, though many of its advanced features (like symmetric multiprocessing support and the sophisticated memory model) aren't demonstrated here.
