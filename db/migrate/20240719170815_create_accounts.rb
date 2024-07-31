class CreateAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts, if_not_exists: true do |t|
      t.string :name
      t.string :workflow_state, null: false
      t.bigint :root_account_id, null: false
      t.timestamps
    end
  end
end
