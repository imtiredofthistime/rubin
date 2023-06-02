class CreateClinics < ActiveRecord::Migration[7.0]
  def change
    create_table :clinics do |t|
      t.string :name
      t.string :owner
      t.integer :year

      t.string :facility_type
      t.string :city
      t.string :mortality

      t.attachment :avatar
    end
  end
end
