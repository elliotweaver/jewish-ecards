# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  # Specify a custom renderer if needed.
  # The default renderer is SimpleNavigation::Renderer::List which renders HTML lists.
  # The renderer can also be specified as option in the render_navigation call.
  # navigation.renderer = Your::Custom::Renderer

  # Specify the class that will be applied to active navigation items. Defaults to 'selected'
  # navigation.selected_class = 'your_selected_class'

  # Specify the class that will be applied to the current leaf of
  # active navigation items. Defaults to 'simple-navigation-active-leaf'
  # navigation.active_leaf_class = 'your_active_leaf_class'

  # Item keys are normally added to list items as id.
  # This setting turns that off
  # navigation.autogenerate_item_ids = false

  # You can override the default logic that is used to autogenerate the item ids.
  # To do this, define a Proc which takes the key of the current item as argument.
  # The example below would add a prefix to each key.
  # navigation.id_generator = Proc.new {|key| "my-prefix-#{key}"}

  # If you need to add custom html around item names, you can define a proc that will be called with the name you pass in to the navigation.
  # The example below shows how to wrap items spans.
  # navigation.name_generator = Proc.new {|name| "<span>#{name}</span>"}

  # The auto highlight feature is turned on by default.
  # This turns it off globally (for the whole plugin)
  # navigation.auto_highlight = false

  # Define the primary navigation
  navigation.items do |primary|
    # Add an item to the primary navigation. The following params apply:
    # key - a symbol which uniquely defines your navigation item in the scope of the primary_navigation
    # name - will be displayed in the rendered navigation. This can also be a call to your I18n-framework.
    # url - the address that the generated item links to. You can also use url_helpers (named routes, restful routes helper, url_for etc.)
    # options - can be used to specify attributes that will be included in the rendered navigation item (e.g. id, class etc.)
    #           some special options that can be set:
    #           :if - Specifies a proc to call to determine if the item should
    #                 be rendered (e.g. <tt>:if => Proc.new { current_user.admin? }</tt>). The
    #                 proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :unless - Specifies a proc to call to determine if the item should not
    #                     be rendered (e.g. <tt>:unless => Proc.new { current_user.admin? }</tt>). The
    #                     proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :method - Specifies the http-method for the generated link - default is :get.
    #           :highlights_on - if autohighlighting is turned off and/or you want to explicitly specify
    #                            when the item should be highlighted, you can set a regexp which is matched
    #                            against the current URI.  You may also use a proc, or the symbol <tt>:subpath</tt>. 
    #
    
    primary.item :home, 'Home', root_url
    primary.item :ecards, 'eCards', "/cards?card_filter%5Boptions%5D%5B%5D=eCards"
    primary.item :einvites, 'eInvites', "/cards?card_filter%5Boptions%5D%5B%5D=eInvites"
    primary.item :downloads, 'Downloads', "/cards?card_filter%5Boptions%5D%5B%5D=Downloads"
    primary.item :calendar, 'Calendar', calendar_url
    primary.item :about, 'About Us', about_url do |sub_nav|
    	sub_nav.item :title, 'More Information'
    	sub_nav.item :about, 'About Us', about_url
    	sub_nav.item :staff, 'About Our Staff', staff_url
    	sub_nav.item :membership, 'Membership Info', membership_url
    	sub_nav.item :terms, 'Terms & Conditions', terms_url
    	sub_nav.item :privacy, 'Privacy Policy', privacy_url
    	sub_nav.item :faqs, 'FAQs', faqs_url
    	sub_nav.item :become, 'Become an eCard Artist', become_url
    	sub_nav.item :help, 'Help', help_url
    end
    primary.item :artists, 'Artists', artists_url do |author_nav|
    	author_nav.item :title, "Artists"
    	Author.all.each do |author|
    		author_nav.item :author, "#{author.first_name} #{author.last_name}", "/cards"
    	end
    end
	  #primary.item :artists, 'Artists', artists_url do |author|
	  #  author.item :author, @author.try(:name), url_for(@author)
	  #end
    primary.item :contacts, 'Contact Us', contacts_url
    primary.item :sign_in, 'Sign In', new_user_session_url, :if => Proc.new { !user_signed_in? }
    primary.item :sign_out, 'Sign Out', destroy_user_session_url, :method => :delete, :if => Proc.new { user_signed_in? }
    
    #primary.item :home, 'Home', root_url, options
    #primary.item :ecards, 'eCards', ecards_url, options do |sub_nav|
      # Add an item to the sub navigation (same params again)
    #  sub_nav.item :key_2_1, 'name', url, options
    #end

    # You can also specify a condition-proc that needs to be fullfilled to display an item.
    # Conditions are part of the options. They are evaluated in the context of the views,
    # thus you can use all the methods and vars you have available in the views.
    #primary.item :key_3, 'Admin', url, :class => 'special', :if => Proc.new { current_user.admin? }
    #primary.item :key_4, 'Account', url, :unless => Proc.new { logged_in? }

    # you can also specify a css id or class to attach to this particular level
    # works for all levels of the menu
    # primary.dom_id = 'menu-id'
    # primary.dom_class = 'menu-class'

    # You can turn off auto highlighting for a specific level
    # primary.auto_highlight = false

  end

end
