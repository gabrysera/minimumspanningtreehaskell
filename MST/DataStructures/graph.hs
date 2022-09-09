module DataStructures.Graph(Node, Graph) where

data Node = {
    label :: String,
    neighbours :: [Node]
}

data Graph = [Node]