class CreatePatientCards < ActiveRecord::Migration[7.0]
  def change
    create_table :patient_cards do |t|
      t.belongs_to :clinic, foreign_key: true
      t.string :name
      t.string :address
      t.timestamps
    end
  end
end
