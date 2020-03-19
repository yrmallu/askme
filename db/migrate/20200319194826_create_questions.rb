class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.references :user
      t.text :body
      t.string :title
      t.timestamps
    end
  end
end
