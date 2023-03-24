# frozen_string_literal: true

class AddRoles < ActiveRecord::Migration[7.0]
  def up
    Role::ROLES.each do |role|
      Role.create!(name: role)
    end
  end

  def down
    Role.destroy_all
  end
end
