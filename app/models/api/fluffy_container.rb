require_relative './fluffy'
module Api
  class FluffyContainer < WashOut::Type
    type_name 'fluffy_con'
    map fluffy: Api::Fluffy
  end
end
