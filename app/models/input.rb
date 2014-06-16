class Input < ActiveRecord::Base
  #enable AR models to use the PostgreSQL COPY command to import/export data in CSV format
  acts_as_copy_target
end