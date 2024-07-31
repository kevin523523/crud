class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses, if_not_exists: true do |t|
      t.string :name
      t.bigint :account_id, null: false
      t.datetime :start_at
      t.datetime :conclude_at
      t.string :course_code
      t.bigint :root_account_id, null: false
      t.bigint :enrollment_term_id, null: false
      t.timestamps
    end
  end
end
    

