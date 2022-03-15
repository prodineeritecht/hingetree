CREATE TABLE tree_nodes (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    parent_id UUID DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL
);
