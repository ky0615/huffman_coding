_ = require "lodash"

getNewNode = (right, left)->
  return new Node null, 1, right, left

class Node
  constructor: (dic, type=0, right, left)->
    @type = type
    @getCount dic, right, left
    @dic = dic
    @right = right
    @left = left

  getCount: (dic, right, left)->
    if right and left
      @count = right.count + left.count
    else if dic
      @count = dic.value

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

  sortQue: (que)->
    que.sort (a,b)->
      if a.count > b.count
        return 1
      else
        return -1

  makeNode: ->
    que = []
    for d in @dic
      que.push new Node d

    while true
      if que.length is 1
        @node = que[0]
        return que[0]
      que.unshift getNewNode que.shift(), que.shift()
      que = @sortQue que

  makeDic: ->
    dic = []
    tmp = []
    # while true
    while true
      n = @_search @node
      console.log n
      if n is undefined
        return

  find: (text)->
    @resule = []
    dic = null
    for d in @dic
      if d.key is text
        dic = d
        break
    unless dic
      console.error "not found the text"
      return
    @_search dic, @node

  _search: (dic, node)->
    count = dic.value
    if node.dic
      @result.push node.dic
      return node
    unless node.left or node.right
      @_search dic, node.parent
    # cache
    node.right.parent = node.left.parent = node
    @_search dic, node.right

  stack: ->
    s = []
    v = []
    result = []
    # when goto left, push to the `1` of v
    # when goto right, push to the `0` of v
    # before the order, push to root tree of s
    tree = @node
    s.push tree
    while true
      if s.length is 0
        console.log "finish"
        break

      if tree?.left
        # access to left
        t = tree.left
        tree.left = null
        s.push tree
        tree = t
        v.push 1
        continue
      else if tree?.right
        t = tree.right
        tree.right = null
        s.push tree
        tree = t
        v.push 0
        continue
      else if tree?.dic
        res =
          tree: tree
          bin: v
        result.push res
        console.log res

        # delete this node of `v` stack
        s.pop()
        v.pop()

        # pop to the stack
        tree = s.pop()
        v.pop()


        # if v.slice(-1)[0] is 1
        #   tree.left = null
        # else
        #   tree.right = null
      console.log "stack:", s.length
      while true
        if tree?.left is null and tree?.right is null
          tree = s.pop()
          v.pop()
        else
          break


    console.log "\n\n\n\nfinish!\n\n\n"
    # console.log JSON.stringify result, null, "  "


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
