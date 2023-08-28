class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :website
      t.string :country
      t.text :description
      t.integer :founded
      t.string :industry
      t.integer :employees_number

      t.timestamps
    end
  end
end
