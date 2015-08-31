require 'guard/rspec/dsl'

group :red_green_refactor, halt_on_fail: true do
  dsl = Guard::RSpec::Dsl.new(self)

  rspec = dsl.rspec
  ruby = dsl.ruby

  guard :rspec, cmd: 'bundle exec rspec', all_on_start: true do
    # Run all specs if Gemfile.lock is modified
    watch('Gemfile.lock') { rspec.spec_dir }

    # Run all specs if supporting files are modified
    watch(rspec.spec_helper) { rspec.spec_dir }
    watch(rspec.spec_support) { rspec.spec_dir }

    # Run a spec if it is modified
    watch(rspec.spec_files)

    # Run all specs if any library code is modified
    dsl.watch_spec_files_for(ruby.lib_files) { rspec.spec_dir }
  end

  guard :rubocop do
    # Run a spec if it is modified
    watch(rspec.spec_files)

    # Run all specs if any library code is modified
    dsl.watch_spec_files_for(ruby.lib_files) { rspec.spec_dir }
  end
end
