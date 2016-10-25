# csharp_nunit

Plan:

client/docker:
  builds cyberdojofoundation/csharp_nunit

client/src:
  build cyberdojofoundation/language_tester

client/starting:
  manifest.json - names the image cyberdojofoundation/csharp_nunit
  visible-files
client/lights:
  manifest.json - names the visible-file to load and use as visible-file
  put into a volume
  mounted into container (image = language_tester)
