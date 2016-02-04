class ChangeTodos < ActiveRecord::Migration
  def change
    change_table :todos do |t|
      t.integer :status, default: 0
      t.integer :sort
      t.change :title, :title, null: false

      t.timestamps
    end
  end
end
