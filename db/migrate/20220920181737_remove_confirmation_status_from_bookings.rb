class RemoveConfirmationStatusFromBookings < ActiveRecord::Migration[6.1]
  def change
    remove_column :bookings, :confirmation_status
  end
end
