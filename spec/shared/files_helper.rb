module FilesHelper
  # call nmax script in shell
  def call_nmax(nmax_args = '', params = {})
    if params[:input_file]
      `cat #{params[:input_file]} | nmax #{nmax_args}`
    else
      `nmax #{nmax_args}`
    end
  end

  # Generate file with size in MB, and contain numbers
  # Return full file name
  # rubocop:disable Metrics/AbcSize
  def generate_file(file_name, megabytes, numbers)
    file_path = File.join(File.dirname(__FILE__), '..', 'files', file_name)

    numbers = numbers.shuffle
    numbers_in_block = (numbers.size.to_f / megabytes).ceil
    block_size = 1024 * 1024

    File.open(file_path, 'w') do |f|
      megabytes.times do
        data = '.' * block_size
        numbers_in_block.times do |i|
          number = numbers.pop
          data[i * 100] = number.to_s if number
        end
        f.write(data)
      end
    end

    file_path
  end
end

RSpec.configure do |config|
  config.include FilesHelper
end
