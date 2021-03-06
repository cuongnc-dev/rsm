class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.text :address
      t.datetime :start_time
      t.datetime :end_time
      t.references :company, foreign_key: true
      t.references :apply, foreign_key: true
      t.timestamps
    end
  end
end
