class CreateWorkingTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :working_times do |t|
      t.datetime   :begin
      t.datetime   :end
      t.belongs_to :employee, index: true, foreign_key: true

      t.timestamps
    end
  end
end