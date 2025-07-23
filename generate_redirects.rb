# generate_redirects.rb

require 'fileutils'

# List your old broken paths without .html extension
redirects = [
  "tag/self-healing",
  "tag/gentle-journaling",
  "tag/journaling-supplies",
  "page/6",
  "page/3",
  "author/the-mindful-nomad/page/8",
  "discover-the-joy-of-junk-journaling-a-beginners-guide",
  "focus-on-your-future-not-the-past",
  "have-a-cozy-night-in",
  "how-to-use-witch-hazel-for-your-skin",
  "journaling-for-physical-health",
  "journaling-through-fatigue-a-gentle-approach-for-chronic-illness-warriors"
]

redirects.each do |path|
  parts = path.split('/')
  dir = File.join("_redirects", *parts[0..-2]) # build nested folder
  FileUtils.mkdir_p(dir)
  filename = "#{parts.last}.html"
  full_path = File.join(dir, filename)

  File.write(full_path, <<~EOF)
    ---
    layout: redirect
    redirect_to: /blog/
    ---
  EOF

  puts "Created redirect: #{full_path}"
end
