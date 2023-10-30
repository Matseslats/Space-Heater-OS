# Space Heater OS
Space Heater OS is an experimental OS designed to run your cpu on 100% usage to heat the room your computer is in.


## Compile
`nasm -f bin boot.asm -o boot.bin`

## Test OS
`qemu-system-x86_64 boot.bin`

## Install required programs on windows
[nasm](https://www.nasm.us/pub/nasm/releasebuilds/2.14.02/win64/)

[qemu](https://qemu.weilnetz.de/w64/)
