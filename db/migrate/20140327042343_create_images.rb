class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url
      t.belongs_to :job, index: true

      t.timestamps
    end
  end
end
