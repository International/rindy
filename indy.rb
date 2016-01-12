require "rubygems"
require "bundler"
Bundler.require(:default)

def menu
  filemenu = Gtk::Menu.new

  file_item = Gtk::MenuItem.new "File"
  filemenu.append(file_item)

  exit_menu_item = Gtk::MenuItem.new "Exit"
  exit_menu_item.signal_connect "activate" do
    Gtk.main_quit
  end

  filemenu.append(exit_menu_item)
  filemenu.show_all

  filemenu

  # mb = Gtk::MenuBar.new

  # filem = Gtk::MenuItem.new "File"
  # filem.set_submenu filemenu
  #
  # exit = Gtk::MenuItem.new "Exit"
  # exit.signal_connect "activate" do
  #   Gtk.main_quit
  # end
  #
  # filemenu.append exit
  #
  # filemenu
  #  mb.append filem
end

ai = AppIndicator::AppIndicator.new("test", "indicator-messages", AppIndicator::Category::APPLICATION_STATUS);

ai.set_menu(menu)
ai.set_status(AppIndicator::Status::ACTIVE)

Gtk.main
