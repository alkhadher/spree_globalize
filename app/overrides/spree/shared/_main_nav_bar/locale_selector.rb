Deface::Override.new(
  virtual_path:  'spree/shared/_main_nav_bar',
  name:          '_main_nav_bar_locale_selector',
  insert_bottom: "#main-nav-bar > .navbar-right",
  text:       <<-HTML
                <% if SpreeGlobalize::Config.supported_locales.many? %>
                  <li id="locale-select" data-hook>
                    <%= form_tag spree.set_locale_path, class: 'navbar-form' do %>
                      <div class="form-group">
                        <label for="switch_to_locale" class="sr-only">
                          <%= Spree.t(:'i18n.language') %>
                        </label>
                        <%= select_tag(:switch_to_locale, options_for_select(supported_locales_options, I18n.locale), class: 'form-control') %>
                        <noscript><%= submit_tag %></noscript>
                      </div>
                    <% end %>
                  </li>
                <% end %>
              HTML
)
