module TradoPdfInvoiceModule
    module Generators
        class InstallGenerator < Rails::Generators::Base
            source_root File.expand_path("../../templates", __FILE__)

            def setup_routes
                route_content = <<-CONTENT

    mount TradoPdfInvoiceModule::Engine => '/'
                CONTENT
                inject_into_file "config/routes.rb", route_content, after: "Trado::Application.routes.draw do"
            end
        end
    end
end