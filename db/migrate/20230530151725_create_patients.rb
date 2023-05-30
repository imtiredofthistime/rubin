class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.references :patient_card, foreign_key: true
      t.string :name
      t.string :email
    end
  end
end
