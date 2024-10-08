class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
