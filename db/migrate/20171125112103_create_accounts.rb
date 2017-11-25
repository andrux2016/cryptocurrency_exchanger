class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.belongs_to :user, foreign_key: true
      t.string :currency
      t.string :address

      t.timestamps
    end
  end
end
