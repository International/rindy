require "rubygems"
require "bundler"
Bundler.require(:default)

class App
  def initialize
    @ai = AppIndicator::AppIndicator.new("test", "indicator-messages", AppIndicator::Category::APPLICATION_STATUS);
    @menu = Gtk::Menu.new

    setup
  end

  def setup
    add_menu_item "File" do
      puts "Clicked on file"
    end

    @ai.set_menu(@menu)
    @ai.set_status(AppIndicator::Status::ACTIVE)

    setup_links

    add_menu_item "Quit" do
      Gtk.main_quit
    end

    @menu.show_all
  end

  def run
    Gtk.main
  end

  private
  def setup_links
    @links = [
      "http://google.com"
    ]

    @links.each do |link|
      add_menu_item link do
        system "sensible-browser", link
      end
    end
  end

  def connect_item(item, action)
    item.signal_connect "activate", &action
  end

  def add_menu_item(label, &action)
    item = Gtk::MenuItem.new(label)
    connect_item(item, action)

    @menu.append(item)
  end
end

App.new.run
