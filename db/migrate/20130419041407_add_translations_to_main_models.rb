class AddTranslationsToMainModels < SpreeExtension::Migration[4.2]
  def up
    unless table_exists?(:spree_property_translations)
      params = { name: :string, presentation: :string }
      Spree::Property.create_translation_table!(params, { migrate_data: true })
    end

    unless table_exists?(:spree_taxonomy_translations)
      Spree::Taxonomy.create_translation_table!({ name: :string }, { migrate_data: true })
    end

    unless table_exists?(:spree_taxon_translations)
      params = { name: :string, description: :text, meta_title: :string,
                 meta_description: :string, meta_keywords: :string,
                 permalink: :string }
      Spree::Taxon.create_translation_table!(params, { migrate_data: true })
    end
  end

  def down
    Spree::Property.drop_translation_table! migrate_data: true
    Spree::Taxonomy.drop_translation_table! migrate_data: true
    Spree::Taxon.drop_translation_table! migrate_data: true
  end
end
