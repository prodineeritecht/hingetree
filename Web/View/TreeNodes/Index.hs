module Web.View.TreeNodes.Index where
import Web.View.Prelude

data IndexView = IndexView { treeNodes :: [TreeNode]  }

instance View IndexView where
    html IndexView { .. } = [hsx|
        {breadcrumb}

        <h1>Index<a href={pathTo NewTreeNodeAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>TreeNode</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach treeNodes renderTreeNode}</tbody>
            </table>
            
        </div>
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "TreeNodes" TreeNodesAction
                ]

renderTreeNode :: TreeNode -> Html
renderTreeNode treeNode = [hsx|
    <tr>
        <td>{treeNode}</td>
        <td><a href={ShowTreeNodeAction (get #id treeNode)}>Show</a></td>
        <td><a href={EditTreeNodeAction (get #id treeNode)} class="text-muted">Edit</a></td>
        <td><a href={DeleteTreeNodeAction (get #id treeNode)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]