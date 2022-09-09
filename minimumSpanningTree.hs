type Label = String

data Node = Node {
    id :: Label,
    neighbours :: [Node]
}

data Graph a = Graph [Node]