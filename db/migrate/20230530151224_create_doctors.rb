class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :surname
      t.references :department, null: false, foreign_key: true
      t.references :specialty, null: false, foreign_key: true
    end
  end
end
