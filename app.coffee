Coding = new (require "./Coding")

console.log JSON.stringify Coding.makeNode(), null, "  "
for data in Coding.dic
  console.log data.key
  console.log Coding.encode data.key
