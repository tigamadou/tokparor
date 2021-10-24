class CreateProductVariantOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :product_variant_options do |t|
      t.references :product, null: false, foreign_key: true
      t.references :product_option, null: false, foreign_key: true

      t.timestamps
    end
  end
end
