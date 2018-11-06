class AddReferencesToPathologyLabTests < ActiveRecord::Migration[5.1]
  def change
    add_reference :pathology_lab_tests, :pathologylab, foreign_key: true
    add_reference :pathology_lab_tests, :test, foreign_key: true
  end
end
