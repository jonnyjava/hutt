class ApplicationApi < Grape::API
  format :json
  extend Napa::GrapeExtenders

  mount VinNumbersApi => '/vin_number'

  resource '/' do
    desc 'Return a message'
    get do
      { message: 'Han, I can’t make exceptions!' }
    end
  end
  add_swagger_documentation
end

