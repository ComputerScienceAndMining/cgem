module SpecimensHelper
  attr_reader :specimens, :specimen

  def find_test_version(test_type_version, specimen)
    specimen.lab_tests.each do |lab_test|
      if lab_test.test_type_version_id == test_type_version.id
        return lab_test
      end
    end

    return test_type
  end
end
