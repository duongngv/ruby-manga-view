class AvatarUploader < CarrierWave::Uploader::Base
  Rails.env.production? ? storage(:fog) : storage(:file)

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def default_url *_args
    ActionController::Base.helpers.asset_path(
      [version_name, "avatar-default.png"].compact.join("")
    )
  end
end
