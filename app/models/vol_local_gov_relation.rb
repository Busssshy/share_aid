class VolLocalGovRelation < ApplicationRecord
  belongs_to :local_government
  belongs_to :volunteer
end
