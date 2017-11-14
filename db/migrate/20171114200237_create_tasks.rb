class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.text :description
      t.string :website
      t.integer :status, default: 0
      t.date :expiration_date
      t.string :header
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
