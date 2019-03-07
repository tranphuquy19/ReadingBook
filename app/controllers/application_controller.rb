class ApplicationController < ActionController::Base
    def hello
        render html: "Xin chào đến với rails!"
    end
end
