const stdin = new ReadableStream({
  start(controller) {
    process.stdin.on('data', (chunk) => {
      controller.enqueue(chunk);
    });
    process.stdin.on('end', () => {
      controller.close();
    });
  },
});

const stdout = new WritableStream({
  write(chunk) {
    process.stdout.write(chunk);
  },
});

stdin.pipeTo(stdout);
