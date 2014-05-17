require 'coveralls'

SimpleCov.configure do
  minimum_coverage 95
  maximum_coverage_drop 5

  start('rails') do
    formatter SimpleCov::Formatter::MultiFormatter[
      SimpleCov::Formatter::HTMLFormatter,
      Coveralls::SimpleCov::Formatter
    ]

    add_group "Long files" do |src_file|
      src_file.lines.count > 100
    end
  end
end
