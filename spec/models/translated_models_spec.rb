module Spree
  RSpec.describe Taxon, type: :model do
    include_context "behaves as translatable"
  end

  RSpec.describe Taxonomy, type: :model do
    include_context "behaves as translatable"
  end

  RSpec.describe Property, type: :model do
    include_context "behaves as translatable"
  end

end
