Coding = new (require "./Coding")

Coding.makeNode()

# Coding.makeDic()
# console.log JSON.stringify Coding.node, null, "  "
# console.log ""
# console.log Coding.dic

# console.log Coding.find "G"
# console.log JSON.stringify Coding.node, ((k,v)->
#     # if k is "type"
#     #   return undefined
#     # unless v
#     #   return undefined
#     return v
#   ), "  "


Coding.stack()


return
count = 0

for data in Coding.dic
  enc = Coding.encode data.key
  console.log data.key, enc.value, enc.bin.length, enc.bin
  count += enc.bin.length * enc.value

console.log "平均符号長:", count
