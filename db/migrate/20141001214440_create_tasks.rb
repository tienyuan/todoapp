class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :description
      t.references :user, index: true
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
