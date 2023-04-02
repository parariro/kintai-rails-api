class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :employee_number, null: false
      t.string :name, null: false
      t.string :employment_status, null: false
      t.string :section, null: false

      t.timestamps
    end
    add_index :employees, :employee_number, unique: true
  end
end
