{ stdenv, fetchurl }:
let
  arch = if stdenv.isLinux
         then "linux-amd64"
         else "darwin-amd64";
  checksum = if stdenv.isLinux
             then "0z3vjlw32l5pc0djlzsyywqngms5kf8j1d838nvi339cdxysbdmh"
             else "1l2ll5szdxp0myfxz68gfyjwxc94i6ri0si67rl648al7rdznma5";
  version = "0.14.1";
in
stdenv.mkDerivation {
  name = "reg-${arch}";

  src = fetchurl {
    url = "https://github.com/genuinetools/reg/releases/download/v${version}/${name}"
    sha256 = checksum;
  };

  buildInputs = [ ];

  phases = [ "installPhase" ];

  installPhase = ''
    chmod +x ${name}
    cp ${name} $out/bin
  '';

  meta = with stdenv.lib; {
    homepage = https://github.com/genuinetools/reg;
    description = "A Docker registry v2 command line client";
    license = licenses.mit;
    maintainers = [ "jstoja" ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}

