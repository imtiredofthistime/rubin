class CreateDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :departments do |t|
      t.string :name
      t.string :description
      t.references :clinic, null: false, foreign_key: true
    end
  end
end
