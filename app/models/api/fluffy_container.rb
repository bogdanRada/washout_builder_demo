require_relative './fluffy'
class Api::FluffyContainer < WashOut::Type
  type_name 'fluffy_con'
  map fluffy: Api::Fluffy
end
