class CreateExcavators < ActiveRecord::Migration[6.0]
  def change
    create_table :excavators do |t|
      t.string :company_name
      t.string :full_address
      t.boolean :crew_onsite, null: false, default: false
      t.references :ticket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
