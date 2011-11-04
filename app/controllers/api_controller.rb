class ApiController < ApplicationController
  
  respond_to :xml
  
  skip_before_filter :verify_authenticity_token
end

