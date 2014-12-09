class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :profile_for, :string
    add_column :users, :is_completed, :boolean, :default=>false
    add_column :users, :profile_f, :string

    add_column :users, :dob, :date
    add_column :users, :religion, :string
    add_column :users, :mother_tongue, :string
    add_column :users, :living_in, :string
    add_column :users, :state, :string
    add_column :users, :mobile_no, :string
    add_column :users, :i_agree, :boolean

    add_column :users, :marital_status, :string
    add_column :users, :height, :string
    add_column :users, :skin_tone, :string
    add_column :users, :body_type, :string

    add_column :users, :diet, :string
    add_column :users, :smoke, :string
    add_column :users, :drink, :string

    add_column :users, :education_level, :string
    add_column :users, :occupation, :string
    add_column :users, :annual_income, :string
    add_column :users, :community, :string
    add_column :users, :more_info, :text
    add_column :users, :profile_id,:string

  end
   
end
