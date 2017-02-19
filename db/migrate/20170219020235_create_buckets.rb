class CreateBuckets < ActiveRecord::Migration[5.0]
  def change
    create_table :buckets do |t|
      t.string :name
      t.integer :user_id
      t.text :description
      t.integer :tot_time_cost
      t.decimal :tot_price

      t.timestamps
    end
  end
end
