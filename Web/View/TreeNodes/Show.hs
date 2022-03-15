module Web.View.TreeNodes.Show where
import Web.View.Prelude

data ShowView = ShowView { treeNode :: TreeNode }

instance View ShowView where
    html ShowView { .. } = [hsx|
        {breadcrumb}
        <h1>Show TreeNode</h1>
        <p>{treeNode}</p>

    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "TreeNodes" TreeNodesAction
                            , breadcrumbText "Show TreeNode"
                            ]