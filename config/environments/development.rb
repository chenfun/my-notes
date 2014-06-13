Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  # Rails只有在連線是來自本地端的時候，才會將發生錯誤時的Call stack trace資訊給瀏覽器顯示。這個設定將所有連線都當做本地端連線，好讓開發模式時所有人連線都可以看到錯誤訊息。
  config.consider_all_requests_local       = true
  # 是否啟用 Controller 層級的快取(我們會在 Controller 一章介紹到有哪些快取方法)，一般來說在開發模式不會啟用，除非你要測試它。
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  # 如果寄信失敗，是否要丟出例外。建議可以改成 true。
  config.action_mailer.raise_delivery_errors = true

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
end
