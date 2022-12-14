$worker  = 2
$timeout = 30
#自分のアプリケーション名（currentがつくことに注意）
$app_dir = "/var/www/cause/current"
$listen  = File.expand_path 'tmp/sockets/unicorn.sock', $cause_dir
$pid     = File.expand_path 'tmp/pids/unicorn.pid', $cause_dir
$std_log = File.expand_path 'log/unicorn.log', $cause_dir

# 上記で設定したものが適応されるよう定義
worker_processes  $worker
working_directory $cause_dir
stderr_path $std_log
stdout_path $std_log
timeout $timeout
listen  $listen
pid $pid

preload_cause true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      Process.kill "QUIT", File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end