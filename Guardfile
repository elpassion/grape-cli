group :red_green_refactor, halt_on_fail: true do
  guard :minitest, all_on_start: false do
    watch(%r{^test/(.*)\/?(.*)_test\.rb$})
    watch(%r{^lib/(.*/)?([^/]+)\.rb$})     { |m| "test/#{m[1]}#{m[2]}_test.rb" }
    watch(%r{^test/test_helper\.rb$})      { 'test' }
  end

  guard :rubocop, all_on_start: false do
    watch(%r{/.+\/.rb$})
    watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
  end
end
