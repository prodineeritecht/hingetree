-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TABLE tree_nodes (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    parent_id UUID DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL
);
