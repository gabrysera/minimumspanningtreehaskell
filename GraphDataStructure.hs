module Graph(Node, Graph) where

type Label = String

data Node = Node {
    id :: Label,
    neighbours :: [Node]
}

data Graph = Graph [Node]