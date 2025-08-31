# generate_redirects.rb

require 'fileutils'

# List your old broken paths without .html extension
redirects = [
  "tag/self-healing",
  "tag/gentle-journaling",
  "tag/journaling-supplies",
  "page/6",
  "page/3",
  "page/2",
  "page/4",
  "page/5",
  "page/7",
  "page/8",
  "page/9",
  "author/the-mindful-nomad/page/8",
  "discover-the-joy-of-junk-journaling-a-beginners-guide",
  "focus-on-your-future-not-the-past",
  "have-a-cozy-night-in",
  "how-to-use-witch-hazel-for-your-skin",
  "journaling-for-physical-health",
  "journaling-through-fatigue-a-gentle-approach-for-chronic-illness-warriors"
  "self-care-ideas-for-busy-people",
  "self-care-ideas-for-stress-relief",
  "self-care-ideas-for-workaholics",
  "self-care-ideas-to-boost-your-mood",
  "self-care-ideas-to-improve-mental-health",
  "self-care-ideas-to-try-today",
  "self-care-routines-for-better-sleep",
  "self-care-routines-for-stress-relief",
  "self-care-routines-to-boost-energy",
  "self-care-routines-to-improve-mental-health",
  "self-care-routines-to-start-today",
  "the-benefits-of-journaling-for-stress-relief",
  "the-benefits-of-journaling-for-mental-health",
  "the-benefits-of-journaling-for-self-discovery",
  "the-benefits-of-journaling-for-self-esteem",
  "the-mindful-nomad",
  "a-quiet-mid-year-check-in/", 
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
