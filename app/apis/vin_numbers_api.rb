class VinNumbersApi < Grape::API
  desc 'Create a vin_number'
  params do
    optional :vin, type: String, desc: 'The car vin'
  end
  post do
    vin_number = VinNumber.create!(permitted_params)
    represent vin_number, with: VinNumberRepresenter
  end

  params do
    requires :vin, desc: 'the vin number'
  end
  route_param :vin do
    desc 'Get an vin_number'
    get do
      vin_number = VinNumber.where(vin: params[:vin])
      represent vin_number, with: VinNumberRepresenter
    end
  end
end
