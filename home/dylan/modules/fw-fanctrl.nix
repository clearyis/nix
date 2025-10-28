{ config, pkgs, lib, ... }

{
# Enable fw-fanctrl
programs.fw-fanctrl.enable = true;

# Add a custom config
programs.fw-fanctrl.config = {
  defaultStrategy = "lazy";
  strategies = {
    "lazy" = {
      fanSpeedUpdateFrequency = 5;
      movingAverageInterval = 30;
      speedCurve = [
        { temp = 0; speed = 15; }
        { temp = 50; speed = 15; }
        { temp = 65; speed = 25; }
        { temp = 70; speed = 35; }
        { temp = 75; speed = 50; }
        { temp = 85; speed = 100; }
      ];
    };
  };
};

# Add a custom config from an existing JSON file
# programs.fw-fanctrl.config = builtins.fromJSON (builtins.readFile ./config.json)

# Or just change the default strategy form the default config
# programs.fw-fanctrl.config.defaultStrategy = "medium";
}
