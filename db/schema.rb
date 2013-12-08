Sequel.migration do
  change do
    create_table(:categories) do
      primary_key :id
      column :title, "varchar(255)"
    end
    
    create_table(:schema_migrations) do
      column :filename, "varchar(255)", :null=>false
      
      primary_key [:filename]
    end
  end
end
Sequel.migration do
  change do
    self << "INSERT INTO `schema_migrations` (`filename`) VALUES ('20131208130206_create_categories.rb')"
  end
end
