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
    end

    create_table :owners do
      primary_key :id
      foreign_key :company_id, :companies, on_delete: :cascade
      String      :name,    null: false
      File        :attachment

      String      :uuid,    null: false, fixed: true, size: 36
    end

    create_table :directors do
      primary_key :id
      foreign_key :company_id, :companies, on_delete: :cascade
      String      :name,    null: false
      File        :attachment

      String      :uuid,    null: false, fixed: true, size: 36
    end

    create_table :data_versions do
      primary_key :id
      String      :uuid,    null: false, fixed: true, size: 36
      json        :data,    null: false
    end

  end

end