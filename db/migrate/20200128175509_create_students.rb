class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :nome
      t.string :matricula
      t.string :email
      t.string :telefone
      t.string :iduff

      t.timestamps
    end
  end
end
