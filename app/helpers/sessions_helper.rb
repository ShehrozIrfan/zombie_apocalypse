module SessionsHelper
    def log_in(survival)
        session[:survival_id] = survival.id
    end
    def current_user
        if session[:survival_id]
            @current_user ||= Survival.find_by(id: session[:survival_id])
        end
    end
    def logged_in?
        !current_user.nil?
    end
    def log_out
        session.delete(:survival_id)
        @current_user = nil
    end
    def current_user?(survival)
        survival && survival == current_user
    end
    def correct_user
        @survival = Survival.find(params[:id])
        redirect_to(root_url) unless @survival == current_user
    end
end
