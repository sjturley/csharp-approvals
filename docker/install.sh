#!/bin/bash -Eeu

mono nuget.exe restore -PackagesDirectory .

mkdir /nunit
mv NUnit.*/lib                  /nunit
mv NUnit.ConsoleRunner.*/tools  /nunit

mv red_amber_green.rb /usr/local/bin
