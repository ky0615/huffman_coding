_ = require "lodash"

class Node
  constructor: (@dic, @type, @right, @left)->

class Coding
  # s/*/space/
  dic:[
    {key: "Z", value: 0.0005},
    {key: "J", value: 0.0008},
    {key: "Q", value: 0.0008},
    {key: "X", value: 0.0013},
    {key: "K", value: 0.0049},
    {key: "V", value: 0.0083},
    {key: "B", value: 0.0127},
    {key: "G", value: 0.0152},
    {key: "P", value: 0.0152},
    {key: "Y", value: 0.0164},
    {key: "W", value: 0.0175},
    {key: "M", value: 0.0198},
    {key: "F", value: 0.0208},
    {key: "C", value: 0.0218},
    {key: "U", value: 0.0228},
    {key: "D", value: 0.0317},
    {key: "L", value: 0.0321},
    {key: "H", value: 0.0467},
    {key: "R", value: 0.0484},
    {key: "S", value: 0.0514},
    {key: "N", value: 0.0574},
    {key: "I", value: 0.0575},
    {key: "O", value: 0.0632},
    {key: "A", value: 0.0642},
    {key: "T", value: 0.0796},
    {key: "E", value: 0.1031},
    {key: "*", value: 0.1859},
  ]

  makeNode: ->
    # copy to the dictionary
    dic = @dic.concat()

    @node = new Node null, 1, new Node(dic.shift(), 0), new Node(dic.shift(), 0)
    while true
      if dic.length is 0
        return @node
      @node = new Node null, 1, new Node(dic.shift(), 0), @node

  encode: (val)->
    unless val
      console.error "value is not defined"
      return
    count = 0
    cnode = _.clone @node, true
    while true
      if cnode.type is 1
        if cnode.right.dic.key is val
          if cnode.left.type is 0
            count++
          cnode.right.dic.count = count
          cnode.right.dic.bin = count.toString(2)
          return cnode.right.dic
        else
          if cnode.left.type is 0
            cnode.left.dic.count = count
            cnode.left.dic.bin = count.toString 2
            return cnode.left.dic
          cnode = cnode.left
          count = count + 1 << 1

module.exports = Coding





