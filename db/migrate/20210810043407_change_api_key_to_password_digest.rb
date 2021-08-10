class ChangeApiKeyToPasswordDigest < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :api_key, :password_digest
  end
end
