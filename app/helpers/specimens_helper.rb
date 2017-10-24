module SpecimensHelper
  attr_reader :specimens, :specimen

  def find_test(test_type, specimen)
    specimen.lab_tests.each do |lab_test|
      if lab_test.test_type_id == test_type.id
        return lab_test
      end
    end

    return test_type
  end
end
