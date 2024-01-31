# streaming-playground

Simple streaming programming in different languages.

## Reproduce the Benchmark

Run the following command to reproduce the benchmark:

```sh
./benchmark.sh
```

## My Results

```sh
----------------
| Get profiles |
----------------
Apple clang version 15.0.0 (clang-1500.1.0.2.5)
Target: arm64-apple-darwin23.2.0
Thread model: posix
InstalledDir: /Library/Developer/CommandLineTools/usr/bin
cargo 1.76.0-nightly (6790a5127 2023-11-10)
--------------------
| Compile programs |
--------------------
    Finished release [optimized] target(s) in 0.00s
------------------
| Run benchmarks |
------------------

name: c/unistd.out < data/16-MB.bin > output
time: (2ms, 14ms, 17ms)
cpu:  95%
mem:  976 KiB

name: node javascript/socket.js < data/16-MB.bin > output
time: (40ms, 13ms, 56ms)
cpu:  95%
mem:  47552 KiB

name: node javascript/webstream.js < data/16-MB.bin > output
time: (47ms, 15ms, 63ms)
cpu:  98%
mem:  41488 KiB

name: target/release/copy < data/16-MB.bin > output
time: (2ms, 14ms, 17ms)
cpu:  93%
mem:  1152 KiB
```