{
  description = ''An alternative time library'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-timestamp-0_2_2.flake = false;
  inputs.src-timestamp-0_2_2.ref   = "refs/tags/0.2.2";
  inputs.src-timestamp-0_2_2.owner = "jackhftang";
  inputs.src-timestamp-0_2_2.repo  = "timestamp.nim";
  inputs.src-timestamp-0_2_2.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-timestamp-0_2_2"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-timestamp-0_2_2";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}