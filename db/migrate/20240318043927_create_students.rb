class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :address
      t.binary :gender
      t.string :father_name
      t.string :password_digest

      t.timestamps
    end
  end
end
