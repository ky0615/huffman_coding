Coding = new (require "./Coding")

Coding.makeNode()

console.log JSON.stringify Coding.node, null, "  "

count = 0

for data in Coding.dic
  enc = Coding.encode data.key
  console.log data.key, enc.value, enc.bin.length, enc.bin
  count += enc.bin.length * enc.value

console.log "平均符号長:", count
