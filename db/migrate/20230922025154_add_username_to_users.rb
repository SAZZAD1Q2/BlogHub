class AddUsernameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_index :users, :username, unique: true
  end
end

# first_user = User.create(username: 'saif', email: 'saif@gmail.com', password: '12345')

