Rails.application.config.assets.version = "1.0"
Rails.application.config.assets.paths << Rails.root.join("node_modules")
Rails.application.config.assets.precompile += %w( devise_users/devise_user.css jobs/job.css )
Rails.application.config.assets.precompile += %w( load_image.js )
Rails.application.config.assets.precompile += %w( companies/company.css companies/language-selector.css )
Rails.application.config.assets.precompile += %w( format_datepicker.js company.js )
Rails.application.config.assets.precompile += %w( employers/employer.css companies/f-style.css )
Rails.application.config.assets.precompile += %w( companies/icon.css)
Rails.application.config.assets.precompile += %w( employer.js jquery.form.min.js)
Rails.application.config.assets.precompile += %w( ckeditor/filebrowser/images/gal_del.png )
Rails.application.config.assets.precompile += %w( mailer.css )
Rails.application.config.assets.precompile += %w( jobs/job.css )
Rails.application.config.assets.precompile += %w( jobs/job_show.css )
Rails.application.config.assets.precompile += %w( employer/plugins.js )
Rails.application.config.assets.precompile += %w( employer/app.js )
Rails.application.config.assets.precompile += %w( employers/search.js )
Rails.application.config.assets.precompile += %w( translate.js )
Rails.application.config.assets.precompile += %w( downloads/downloads.css )
Rails.application.config.assets.precompile += %w( selectboxit/src/javascripts/jquery.selectBoxIt.js )
Rails.application.config.assets.precompile += %w( selectboxit/custom_selectboxit.js )
Rails.application.config.assets.precompile += %w( job.js )
Rails.application.config.assets.precompile += %w( app.js )
Rails.application.config.assets.precompile += %w( employers/edit_companies.css )
Rails.application.config.assets.precompile += %w( employer/checkbox.css )
Rails.application.config.assets.precompile += %w( profile.js )
