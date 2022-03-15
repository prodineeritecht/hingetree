module Web.Controller.TreeNodes where

import Web.Controller.Prelude
import Web.View.TreeNodes.Index
import Web.View.TreeNodes.New
import Web.View.TreeNodes.Edit
import Web.View.TreeNodes.Show

instance Controller TreeNodesController where
    action TreeNodesAction = do
        treeNodes <- query @TreeNode |> fetch
        render IndexView { .. }

    action NewTreeNodeAction = do
        let treeNode = newRecord
        render NewView { .. }

    action ShowTreeNodeAction { treeNodeId } = do
        treeNode <- fetch treeNodeId
        render ShowView { .. }

    action EditTreeNodeAction { treeNodeId } = do
        treeNode <- fetch treeNodeId
        render EditView { .. }

    action UpdateTreeNodeAction { treeNodeId } = do
        treeNode <- fetch treeNodeId
        treeNode
            |> buildTreeNode
            |> ifValid \case
                Left treeNode -> render EditView { .. }
                Right treeNode -> do
                    treeNode <- treeNode |> updateRecord
                    setSuccessMessage "TreeNode updated"
                    redirectTo EditTreeNodeAction { .. }

    action CreateTreeNodeAction = do
        let treeNode = newRecord @TreeNode
        treeNode
            |> buildTreeNode
            |> ifValid \case
                Left treeNode -> render NewView { .. } 
                Right treeNode -> do
                    treeNode <- treeNode |> createRecord
                    setSuccessMessage "TreeNode created"
                    redirectTo TreeNodesAction

    action DeleteTreeNodeAction { treeNodeId } = do
        treeNode <- fetch treeNodeId
        deleteRecord treeNode
        setSuccessMessage "TreeNode deleted"
        redirectTo TreeNodesAction

buildTreeNode treeNode = treeNode
    |> fill @["parentId","name"]
