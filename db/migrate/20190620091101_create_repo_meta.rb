class CreateRepoMeta < ActiveRecord::Migration[5.2]
  def change
    create_table :repo_meta do |t|
      t.integer :repo_id
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
