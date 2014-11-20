class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :from
      t.string :to
      t.datetime :date

      t.timestamps
    end
  end
end
