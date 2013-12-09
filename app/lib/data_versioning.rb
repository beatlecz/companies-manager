module DataVersioning

  def backup_version
    DataVersion.create uuid: self.uuid,
                       data: Oj.dump(self.values.slice(*self.class.updatable_columns))
  end

  def cleanup_versions
    DataVersion.where(uuid: self.uuid).delete
  end

end