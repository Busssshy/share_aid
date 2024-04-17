class LocalGovStockRelation < ApplicationRecord
  belongs_to :stock
  belongs_to :local_government
end
