RailsAdmin.config do |config|
  # If current user not admin, not log in at rails admin
  config.authorize_with do
    redirect_to '/' unless current_user.role == 'admin'
  end

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  #config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    # Change name backend RailsAdmin
    config.main_app_name = ['API TFG']

    dashboard                     # mandatory
    index                         # mandatory
    new do
      except ['Frame', 'Datum', 'ValueMax', 'ValueMin', 'LastFrame'] # Disable action new at models indicate
    end
    export
    bulk_delete
    show
    edit do
      except ['Frame', 'Datum', 'ValueMax', 'ValueMin', 'LastFrame'] # Disable action delete at models indicate
    end
    delete do
      except ['Frame', 'Datum', 'ValueMax', 'ValueMin', 'LastFrame'] # Disable action delete at models indicate
    end
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
