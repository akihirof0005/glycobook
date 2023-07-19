mkdir lib/jar
curl "https://gitlab.com/glycoinfo/wurcsframework/-/package_files/73054558/download" -o "lib/jar/wurcsframework-1.2.13.jar"
curl "https://gitlab.com/glycoinfo/wurcsframework/-/package_files/70458150/download" -o "lib/jar/wurcsframework-1.0.1.jar"
curl "https://repo1.maven.org/maven2/org/slf4j/slf4j-api/2.0.7/slf4j-api-2.0.7.jar" -o "lib/jar/slf4j-api-2.0.7.jar"
curl "https://gitlab.glyco.info/glycosmos/subsumption/subsumption/-/package_files/238/download" -o "lib/jar/subsumption-0.9.5.jar"
curl "https://gitlab.glyco.info/glycosmos/glytoucangroup/archetype/lib/-/package_files/334/download" -o "lib/jar/archetype-0.1.0.jar"
curl "https://gitlab.com/glycoinfo/glycanformatconverter/-/package_files/81149971/download" -o "lib/jar/glycanformatconverter-2.9.1.jar"
curl "https://raw.githubusercontent.com/glycoinfo/MavenRepository/master/org/eurocarbdb/MolecularFramework/1.0.0/MolecularFramework-1.0.0.jar" -o "lib/jar/MolecularFramework-1.0.0.jar"