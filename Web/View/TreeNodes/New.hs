module Web.View.TreeNodes.New where
import Web.View.Prelude

data NewView = NewView { treeNode :: TreeNode }

instance View NewView where
    html NewView { .. } = [hsx|
        {breadcrumb}
        <h1>New TreeNode</h1>
        {renderForm treeNode}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "TreeNodes" TreeNodesAction
                , breadcrumbText "New TreeNode"
                ]

renderForm :: TreeNode -> Html
renderForm treeNode = formFor treeNode [hsx|
    {(textField #parentId)}
    {(textField #name)}
    {submitButton}

|]