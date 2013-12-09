module UpdatableColumns
  def updatable_columns
    self.columns - [:id, :created_at, :updated_at, :uuid]
  end
end