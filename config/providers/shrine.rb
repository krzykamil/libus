# frozen_string_literal: true

Hanami.app.register_provider(:shrine) do
  prepare do
    require "shrine"
    require "shrine/storage/file_system"
  end

  start do
    root_dir = (Hanami.env?(:test)) ? Hanami.app.root.join("spec", "tmp") : "public"
    Shrine.storages = {
      cache: Shrine::Storage::FileSystem.new(root_dir, prefix: "uploads/cache"),
      store: Shrine::Storage::FileSystem.new(root_dir, prefix: "uploads"),
    }

    Shrine.plugin :sequel
    Shrine.plugin :cached_attachment_data
    Shrine.plugin :restore_cached_data
    Shrine.plugin :form_assign
    Shrine.plugin :rack_file
    Shrine.plugin :validation_helpers
    Shrine.plugin :determine_mime_type

    register :shrine, Shrine
  end
end
