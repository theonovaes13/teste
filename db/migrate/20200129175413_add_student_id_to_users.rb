class AddStudentIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :student , index: true
  end
end
