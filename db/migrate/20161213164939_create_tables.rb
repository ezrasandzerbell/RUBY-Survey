class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table(:surveys) do |t|
      t.column(:name, :string)
    end
    create_table(:questions) do |t|
      t.column(:name, :string)
      t.column(:survey_id, :int)
    end
  end
end
