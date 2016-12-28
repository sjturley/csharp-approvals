# csharp_nunit

Plan:

- docker/
  * builds cyberdojofoundation/csharp_nunit

- language_tester/
  * builds cyberdojofoundation/language_tester

- start_point/
  * manifest.json - names the image cyberdojofoundation/csharp_nunit
  * visible-files
  * mounted into language_tester container

- traffic_lights/
  * manifest.json - names the visible-file to load and use as visible-file
  * mounted into language_tester container
