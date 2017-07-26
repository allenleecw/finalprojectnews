class CreateJoinTableFavcompanyUser < ActiveRecord::Migration[5.1]
  def change
      create_table :favcompanies_users, :id => false do |t|
      t.integer :favcompany_id
      t.integer :user_id
    end
  end
end
