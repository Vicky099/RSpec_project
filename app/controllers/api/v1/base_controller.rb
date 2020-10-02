class Api::V1::BaseController < ApplicationController
	protect_from_forgery prepend: true
end
