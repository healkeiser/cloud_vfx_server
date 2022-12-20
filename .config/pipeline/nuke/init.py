# -*- coding: utf-8 -*-
"""Init script for Nuke."""

# ------ Libraries
import os, nuke

# ------ Metadatas
__author__ = "Valentin Beaumont"
__email__ = "valentin.onze@gmail.com"

###### CODE ####################################################################

def loadPlugins():
  nuke_path = os.getenv("NUKE_PATH")
  plugin_path = os.path.join(nuke_path, "plugins/plugin_name")
  if os.path.isdir(plugin_path):
    nuke.pluginAddPath(plugin_path)

if __name__ == "__main__":
    loadPlugins()
