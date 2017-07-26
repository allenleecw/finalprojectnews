class CreateFavcompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :favcompanies do |t|
      t.string :name

      t.timestamps
    end
  end
end
