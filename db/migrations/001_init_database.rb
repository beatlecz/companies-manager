Sequel.migration do

  change do

    create_table :companies do
      primary_key :id
      String      :name,    null: false
      String      :address, null: false
      String      :city,    null: false
      String      :country, null: false
      String      :email
      String      :phone

      String      :uuid,    null: false, fixed: true, size: 36

      DateTime    :created_at, null: false
      DateTime    :updated_at, null: false
    end

    create_table :owners do
      primary_key :id
      foreign_key :company_id, :companies, on_delete: :cascade

      String      :name,        null: false

      Bool        :is_director, null: false, default: false

      String      :uuid,        null: false, fixed: true, size: 36

      DateTime    :created_at,  null: false
      DateTime    :updated_at,  null: false
    end

    create_table :attachments do
      primary_key :id
      foreign_key :owner_id, :owners, null: false, on_delete: :cascade

      String      :name
      String      :content_type
      String      :size
      File        :data,  null: false

      DateTime    :created_at,  null: false
      DateTime    :updated_at,  null: false
    end

    create_table :data_versions do
      primary_key :id
      String      :uuid,    null: false, fixed: true, size: 36
      json        :data,    null: false

      DateTime    :created_at, null: false
    end

  end

end