module ApplicationHelper
  def cdn_ready_blob_path(attachment)
    service = Rails.application.config.active_storage.service
    if service == :local
      # 元々のヘルパ
      rails_blob_path(attachment)
      # rails_representation_path(attachment).variant(resize: "100x100")
    elsif service == :amazon
      # S3上でのファイル名を取得してURLを組み立てる
      key = attachment&.blob&.key
      # key = attachment&.blob&.variant(resize: "300x300")&.key
      "https://ddt43vz7r2may.cloudfront.net/#{key}"
    end
  end
end
