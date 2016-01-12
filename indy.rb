require "rubygems"
require "bundler"
Bundler.require(:default)

ai = AppIndicator::AppIndicator.new("test", "indicator-messages", AppIndicator::Category::APPLICATION_STATUS);

ai.set_menu(Gtk::Menu.new)
ai.set_status(AppIndicator::Status::ACTIVE)

Gtk.main
