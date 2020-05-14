
lambda { |stdout,stderr,status|
  output = stdout + stderr
  return :green if /^\s*Test Count: \d+, Passed: \d+, Failed: 0, Warnings: \d+, Inconclusive: \d+, Skipped: \d+/.match(output)
  return :red   if /^\s*Test Count: \d+, Passed: \d+, Failed: \d*, Warnings: \d+, Inconclusive: \d+, Skipped: \d+/.match(output)
  return :amber
}
