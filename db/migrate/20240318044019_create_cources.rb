class CreateCources < ActiveRecord::Migration[7.1]
  def change
    create_table :cources do |t|
      t.string :name
      t.integer :length

      t.timestamps
    end
  end
end
