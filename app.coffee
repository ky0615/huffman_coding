Coding = new (require "./Coding")

Coding.makeNode()

# Coding.makeDic()
# console.log JSON.stringify Coding.node, null, "  "
# console.log ""
# console.log Coding.dic

# console.log Coding.find "G"
console.log JSON.stringify Coding.node, ((k,v)->
    # if k is "type"
    #   return undefined
    unless v
      return undefined
    return v
  ), "  "


stack = Coding.stack()
count = 0
count2 = 0
for data in stack
  # console.log data.key, data.count, data.bin.length, data.bin
  count += data.bin.length * data.count
  count2 -= (Math.log(data.count) / Math.log(2.0)) * data.count

console.log "平均符号長:", count
console.log "平均情報量:", count2
