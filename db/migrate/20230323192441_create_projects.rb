class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :summary
      t.integer :state

      t.timestamps
    end
  end
end
