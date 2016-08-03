class VinNumberRepresenter < Napa::Representer
  property :id, type: String
  property :vin, type: String
  collection :properties, class: Property do
    property :name
    property :value
  end
end
