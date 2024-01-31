#! /usr/bin/env zsh

# Configure envrionment variables
export TIMEFMT='
name: %J
time: (%mU, %mS, %mE)
cpu:  %P
mem:  %M KiB'

echo '----------------'
echo '| Get profiles |'
echo '----------------'

gcc -v
cargo -V

echo '--------------------'
echo '| Compile programs |'
echo '--------------------'

gcc -o c/unistd.out -O3 c/unistd.c
cargo build --release

echo '------------------'
echo '| Run benchmarks |'
echo '------------------'

c/unistd.out < data/1-B.in > output
time c/unistd.out < data/16-MB.bin > output
diff data/16-MB.bin output

node javascript/socket.js < data/1-B.in > output
time node javascript/socket.js < data/16-MB.bin > output
diff data/16-MB.bin output

node javascript/webstream.js < data/1-B.in > output
time node javascript/webstream.js < data/16-MB.bin > output
diff data/16-MB.bin output

target/release/copy < data/1-B.in > output
time target/release/copy < data/16-MB.bin > output
diff data/16-MB.bin output
