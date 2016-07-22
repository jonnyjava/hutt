class VinNumbersApi < Grape::API
  desc 'Get a list of vin_numbers'
  params do
    optional :ids, type: Array, desc: 'Array of vin_number ids'
  end
  get do
    vin_numbers = params[:ids] ? VinNumber.where(id: params[:ids]) : VinNumber.all
    represent vin_numbers, with: VinNumberRepresenter
  end

  desc 'Create a vin_number'
  params do
    optional :vin, type: String, desc: 'The car vin'
  end

  post do
    vin_number = VinNumber.create!(permitted_params)
    represent vin_number, with: VinNumberRepresenter
  end

  params do
    requires :id, desc: 'ID of the vin_number'
  end
  route_param :id do
    desc 'Get an vin_number'
    get do
      vin_number = VinNumber.find(params[:id])
      represent vin_number, with: VinNumberRepresenter
    end

    desc 'Update an vin_number'
    params do
    end
    put do
      # fetch vin_number record and update attributes.  exceptions caught in app.rb
      vin_number = VinNumber.find(params[:id])
      vin_number.update_attributes!(permitted_params)
      represent vin_number, with: VinNumberRepresenter
    end
  end
end
