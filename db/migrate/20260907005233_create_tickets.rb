class CreateTickets < ActiveRecord::Migration[8.1]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.string :status
      t.string :priority
      t.date :due_date
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
