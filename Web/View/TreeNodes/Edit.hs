module Web.View.TreeNodes.Edit where
import Web.View.Prelude

data EditView = EditView { treeNode :: TreeNode }

instance View EditView where
    html EditView { .. } = [hsx|
        {breadcrumb}
        <h1>Edit TreeNode</h1>
        {renderForm treeNode}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "TreeNodes" TreeNodesAction
                , breadcrumbText "Edit TreeNode"
                ]

renderForm :: TreeNode -> Html
renderForm treeNode = formFor treeNode [hsx|
    {(textField #parentId)}
    {(textField #name)}
    {submitButton}

|]