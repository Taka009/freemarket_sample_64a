class CreateEvaluationsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations_users do |t|
      t.references :users, null: false, foreign_key: true
      t.references :evaluation, null: false, foreign_key: true
      t.timestamps
    end
  end
end
