class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.decimal :estimated_cost
      t.decimal :actual_cost
      t.integer :estimated_time
      t.integer :actual_time
      t.boolean :completed
      t.boolean :pay_on_complete

      t.timestamps
    end
  end
end
