require "rindy/version"
require "ruby-libappindicator"

module Rindy
  class App
    def initialize
      svg_path = File.expand_path(
        File.join(File.dirname(__FILE__),"../icons/fire.svg")
      )
      @ai = AppIndicator::AppIndicator.new(
        "test",
        svg_path,
        AppIndicator::Category::APPLICATION_STATUS
      )

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

    class AppLink
      attr_reader :url, :title

      def initialize(title:,url:)
        @title = title
        @url = url
      end

    end

    private
    def setup_links
      @link_items = [
        AppLink.new(title: "Google", url: "http://google.com")
      ]

      @link_items.each do |item|
        add_menu_item item.title do
          system "sensible-browser", item.url
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
end
