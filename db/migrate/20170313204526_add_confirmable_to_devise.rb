class AddConfirmableToDevise < ActiveRecord::Migration[5.0]
  def up
    add_column :subscribers, :confirmation_token, :string
    add_column :subscribers, :confirmed_at, :datetime
    add_column :subscribers, :confirmation_sent_at, :datetime

    add_column :subscribers, :unconfirmed_email, :string # Only if using reconfirmable
    add_index :subscribers, :confirmation_token, unique: true
    # User.reset_column_information # Need for some types of updates, but not for update_all.
    # To avoid a short time window between running the migration and updating all existing
    # subscribers as confirmed, do the following
    execute("UPDATE subscribers SET confirmed_at = NOW()")
    # All existing user accounts should be able to log in after this.
  end

  def down
    remove_columns :subscribers, :confirmation_token, :confirmed_at, :confirmation_sent_at
    remove_columns :subscribers, :unconfirmed_email # Only if using reconfirmable
  end
end
