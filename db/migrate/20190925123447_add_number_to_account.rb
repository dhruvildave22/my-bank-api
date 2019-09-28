# frozen_string_literal: true

class AddNumberToAccount < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :number, :string
  end
end
