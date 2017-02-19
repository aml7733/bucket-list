class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :bucket_id
      t.decimal :price
      t.integer :time_cost_in_days

      t.timestamps
    end
  end
end
