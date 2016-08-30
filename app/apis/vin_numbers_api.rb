class VinNumbersApi < Grape::API
  params do
    requires :vin, type: String, desc: 'the vin number'
  end
  route_param :vin do
    desc 'Decode an vin_number'
    post do
      vin_number = VinNumber.find_or_create_by_vin_number(permitted_params[:vin])
      represent vin_number, with: VinNumberRepresenter
    end
  end
end
