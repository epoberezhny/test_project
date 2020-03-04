class AddUniqueIndexToRequestNumberInTickets < ActiveRecord::Migration[6.0]
  def change
    add_index :tickets, :request_number, unique: true
  end
end
