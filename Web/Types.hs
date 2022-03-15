module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data WebApplication = WebApplication deriving (Eq, Show)


data StaticController = WelcomeAction deriving (Eq, Show, Data)

data TreeNodesController
    = TreeNodesAction
    | NewTreeNodeAction
    | ShowTreeNodeAction { treeNodeId :: !(Id TreeNode) }
    | CreateTreeNodeAction
    | EditTreeNodeAction { treeNodeId :: !(Id TreeNode) }
    | UpdateTreeNodeAction { treeNodeId :: !(Id TreeNode) }
    | DeleteTreeNodeAction { treeNodeId :: !(Id TreeNode) }
    deriving (Eq, Show, Data)
