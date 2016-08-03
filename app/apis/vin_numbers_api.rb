class VinNumbersApi < Grape::API
  params do
    requires :vin, desc: 'the vin number'
  end
  route_param :vin do
    desc 'Get an vin_number'
    get do
      vin_number = VinNumber.find_or_create_by_vin_number(permitted_params[:vin])
      represent vin_number, with: VinNumberRepresenter
    end
  end
end
