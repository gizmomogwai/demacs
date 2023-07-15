def wd
  Dir.getwd
end

desc "run"
task :run do
  sh "podman run --arch=amd64 --shm-size=512m -v#{wd}:/demacs --rm --interactive --tty localhost/demacs"
end

desc "build"
task :build do
  sh "podman build --arch=amd64 -t localhost/demacs ."
end

task default: [:run]
