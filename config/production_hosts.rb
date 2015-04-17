class ConfigAccessor
  def initialize(yaml)
    @hash = YAML.load(yaml)
  end

  def kochiku_web_protocol
    @hash['kochiku_web_protocol']
  end

  def kochiku_web_host
    @hash['kochiku_web_host']
  end

  def redis_host
    @hash['redis_host']
  end

  def worker_hosts
    @hash['worker_hosts']
  end

  def aws_access_key
    @hash['aws_access_key']
  end

  def aws_secret_key
    @hash['aws_secret_key']
  end
end

CONF_FILE = File.expand_path('production_hosts.yml', File.dirname(__FILE__))

if !File.exist?(CONF_FILE)
  raise "#{CONF_FILE} is required to deploy kochiku-worker"
else
  HostSettings = ConfigAccessor.new(File.read(CONF_FILE))
end