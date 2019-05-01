class SessionController < ApplicationController
    def login
    end

    def validate
      email = params['email']
      password = params['password']
      [Donor, Socialcompany, Company].each do |u|
        ua = u.authenticate(email, password)
        if ua
          sign_in(ua)
          flash[:login_success] = "Haz iniciado correctamente una sesión como #{u.name}"
          # redirect_to perfil_usuario
          redirect_to root_path
          return
        end
      end
      flash[:login_failed] = 'Credenciales incorrectas'
      redirect_to :login_path
    end

    def logout
      sign_out
      redirect_to root_path
    end

    def registration_table
    end
end
