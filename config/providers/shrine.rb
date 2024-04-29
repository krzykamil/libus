# frozen_string_literal: true

Hanami.app.register_provider(:shrine) do
  prepare do
    require "shrine"
    require "shrine/storage/file_system"
    require "shrine/storage/s3"
  end

  start do
    s3_options = {
      bucket: target["settings"].s3_bucket,
      region: target["settings"].s3_region,
      access_key_id: target["settings"].s3_access_key_id,
      secret_access_key: target["settings"].s3_secret_access_key
    }

    permanent_storage = if Hanami.env?(:test)
                          Shrine::Storage::FileSystem.new("spec/tmp/", prefix: "uploads")
                        else
                          Shrine::Storage::S3.new(**s3_options)
                        end

    Shrine.storages = {
      cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary
      store: permanent_storage
    }

    Shrine.plugin :entity
    Shrine.plugin :cached_attachment_data
    Shrine.plugin :restore_cached_data
    Shrine.plugin :form_assign
    Shrine.plugin :rack_file
    Shrine.plugin :validation_helpers
    Shrine.plugin :determine_mime_type

    register :shrine, Shrine
  end
end
