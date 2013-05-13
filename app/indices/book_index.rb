ThinkingSphinx::Index.define :book, :with => :active_record do
  indexes name, sortable: true
  indexes content
  indexes publishing_house
  indexes :ISBN

  indexes authors.name, :as => :authors

  has id, created_at, updated_at
end
