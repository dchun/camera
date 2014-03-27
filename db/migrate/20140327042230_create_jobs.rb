class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :number
      t.string :customer
      t.string :equipment
      t.text :notes

      t.timestamps
    end
  end
end
