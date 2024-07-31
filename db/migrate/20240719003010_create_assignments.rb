class CreateAssignments < ActiveRecord::Migration[7.1]
  def change
    create_table :assignments, if_not_exists: true do |t|
      t.string :title
      t.text :description
      t.bigint :context_id, null: false
      t.string :context_type, null: false
      t.bigint :root_account_id, null: false
      t.timestamps
    end
  end
end

