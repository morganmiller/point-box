class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.string :name
      t.text :description
      t.integer :cost

      t.timestamps null: false
    end
  end
end
